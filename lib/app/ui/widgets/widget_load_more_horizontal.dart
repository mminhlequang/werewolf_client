import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget_circle_progress.dart';

typedef Future<List<T>> HorizontalDataRequester<T>(int offset);
typedef Future<List<T>> HorizontalInitRequester<T>();
typedef Widget HorizontalItemBuilder<T>(
    List<T> data, BuildContext context, int index);

class WidgetLoadMoreHorizontal<T> extends StatefulWidget {
  WidgetLoadMoreHorizontal.build(
      {Key key,
      @required this.itemBuilder,
      @required this.dataRequester,
      @required this.initRequester,
      this.styleError,
      this.loadingColor,
      this.loadingColorBackground,
      this.widgetError})
      : assert(itemBuilder != null),
        assert(dataRequester != null),
        assert(initRequester != null),
        super(key: key);

  final TextStyle styleError;
  final HorizontalItemBuilder itemBuilder;
  final HorizontalDataRequester dataRequester;
  final HorizontalInitRequester initRequester;
  final Color loadingColor;
  final Color loadingColorBackground;
  final Widget widgetError;

  @override
  State createState() => new WidgetLoadMoreHorizontalState<T>();
}

class WidgetLoadMoreHorizontalState<T> extends State<WidgetLoadMoreHorizontal> {
  bool isPerformingRequest = false;
  ScrollController _controller = new ScrollController();
  List<T> _dataList;

  @override
  void initState() {
    super.initState();
    this.onRefresh();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color loadingColor = widget.loadingColor ?? Theme.of(context).primaryColor;
    return this._dataList == null
        ? loadingProgress()
        : (this._dataList.length > 0
            ? RefreshIndicator(
                color: loadingColor,
                onRefresh: this.onRefresh,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _dataList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _dataList.length) {
                      return opacityLoadingProgress(isPerformingRequest);
                    } else {
                      return widget.itemBuilder(_dataList, context, index);
                    }
                  },
                  controller: _controller,
                  padding: EdgeInsets.all(0),
                ),
              )
            : RefreshIndicator(
                color: loadingColor,
                onRefresh: this.onRefresh,
                child: Stack(
                  children: [
                    ListView(scrollDirection: Axis.horizontal),
                    Center(
                        child: widget.widgetError ??
                            Text(
                              "Data empty",
                              style: widget.styleError,
                            )),
                  ],
                ),
              ));
  }

  Future<Null> onRefresh() async {
    if (mounted) this.setState(() => this._dataList = null);
    List initDataList = await widget.initRequester();
    if (mounted) this.setState(() => this._dataList = initDataList);
    return;
  }

  _loadMore() async {
    if (mounted) {
      this.setState(() => isPerformingRequest = true);
      int currentSize = 0;
      if (_dataList != null) currentSize = _dataList.length;

      List<T> newDataList = await widget.dataRequester(currentSize);
      if (newDataList != null) {
        if (newDataList.length == 0) {
          double edge = 50.0;
          if (_controller.hasClients) {
            double offsetFromBottom = _controller.position.maxScrollExtent -
                _controller.position.pixels;
            if (offsetFromBottom < edge) {
              _controller.animateTo(
                  _controller.offset - (edge - offsetFromBottom),
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.easeOut);
            }
          }
        } else {
          _dataList.addAll(newDataList);
        }
      }
      if (mounted) this.setState(() => isPerformingRequest = false);
    }
  }

  Widget loadingProgress() {
    return Center(
      child: WidgetCircleProgress(
        color: widget.loadingColor,
        colorBackground: widget.loadingColorBackground,
      ),
    );
  }

  Widget opacityLoadingProgress(isPerformingRequest) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new Opacity(
            opacity: isPerformingRequest ? 1.0 : 0.0,
            child: WidgetCircleProgress(
              color: widget.loadingColor,
              colorBackground: widget.loadingColorBackground,
            ),
          ),
        ));
  }
}

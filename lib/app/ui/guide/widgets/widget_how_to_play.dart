import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetHowToPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Text(
            'Trò chơi chia làm 2 buổi ban ngày và ban đêm.\n\nBắt đầu vào đêm đầu tiên, các vai trò đặc biệt sẽ được quản trò gọi dậy trong đêm, các vai trò như dân làng, cô bé sẽ ngủ suốt đêm cho đến khi trời sáng.\n\nBan ngày là thời gian tất cả cùng thức dậy và cùng nhau thảo luận ai là sói để thực hiện treo cổ (có thể chọn treo cổ hoặc không). Bất cứ ai bị chọn treo cổ sẽ có khoảng thời gian để biện hộ cho mình, sau đó những người bình chọn sẽ biểu quyết là sống hoặc chết, nếu phiếu chết cao hơn, người đó sẽ bị loại ra khỏi cuộc chơi (không được tham gia bất cứ hoạt động nào sau đó, kể cả thảo luận).\n\nGame có thể sẽ xuất hiện thêm phe thứ 3 nếu có các vai trò đặc biệt được người quản trò bỏ vào, càng nhiều người chơi thì sẽ càng nhiều vai trò. Số lượng sói, dân và phe thứ 3 cũng sẽ thay đổi theo số lượng người tham gia chơi.\n\nTrò chơi sẽ kết thúc khi:\n- Phe sói có số lượng ngang phe người - Sói Thắng\n- Phe sói bị tiêu diệt hết - Người thắng\n- Phe thứ 3 thực hiện xong nhiệm vụ của mình - Phe thứ 3 thắng'));
  }
}

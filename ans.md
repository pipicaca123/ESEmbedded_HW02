圖中暫存器意義：
	程式中:
	第一次push：r6->sp,r7->sp+4,r8->sp+8
	第二次push：r9->sp,r10->sp+4,r11->sp+8
	(sp代表stack pointer 中最底層，每+4則往上推出原位置上面一個值)
	r4：用於輔助表達sp位置

由demo.png中看出無論在push {r0,r1,r2}或push {r2,r0,r1}：r0均在最底層,r1均在中間,r2均在最頂部，所以推論：無論我們push中排序如何，其實並不影響它放入stack中的情形。


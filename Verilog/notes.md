# 用 Verilog 重做一次 nand2tetris 的所有習題
* 12/18 第一章完成
* 12/19 第二章完成
* 12/20 第三章完成
* 12/22 第五章完成

## 心得
### 期中
這學期剛開始學習計算機結構時，知道CPU是由一堆基本邏輯閘組成時，讓我以為又要在學一次數位邏輯學過的東西，當老師說要利用nand2teritris學習這門課時，
我以為只需要學習如何將邏輯閘排列組合成CPU就好。但真正開始學習以後，我發現數位邏輯中學習到的知識在這裡會被充分利用，雖然還是有種在學一次數位邏輯的感覺，
但當我自己在製作邏輯閘程式的時候又覺得很有趣，每製作出一個邏輯閘，就會覺得非常的有成就感。
當我再利用Verilog製作一次nand2tertris時，剛開始的時候覺得非常的困難，因為跟hdl檔的語法還有邏輯不太一樣，而且hdl檔會幫你把輸入、輸出變數都設定好，
而Verilog則是要我從設定變數到輸出結果都要自己製作。讓我一開始的時候覺得很難，但這還不是最困難的，我覺得最困難是製作Verilog的測試檔，跟hdl檔不一樣，
因為nand2tertris有提供測試檔，所以當我製作完hdl檔的程式時，只需要將它放入工具內執行就好，Verilog則需要自己製作出測試檔，雖然製作的過程中有點痛苦，
但在做完時也是很有成就感的，因為學會了一項新東西，雖然還不是那麼的熟練。

## 參考資料
* gates16_test.v
* ALU_test.v
* RAM16_test.v
* Memory.v (DFF, RAM8K, RAM16K, ROM32K)
* PC_test.v
* computer.v
* computer_test.v
* sum.hack
 
 參考[老師的專案](https://gitlab.com/cccnqu111/co/-/tree/master/verilog/02-nand2tetris)

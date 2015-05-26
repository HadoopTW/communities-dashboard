如何使用這個範例
================

1. 請登入 Facebook 帳號，前往 https://developers.facebook.com/tools/explorer/ 取得 access_token，並填入 config 檔中
2. 這個範例是取得以下幾個社群粉絲團的會員列表，並將資料整理成 CSV 格式。因此，您將需要「加入」想要研究的粉絲團。
    * bigdata_facebook.sh 會分析以下四個社群
        * [opendata-tw](https://www.facebook.com/groups/odtwn/)
        * [hadoop-tw](https://www.facebook.com/groups/hadoop.tw/)
        * [nosql-tw](https://www.facebook.com/groups/423848814337101/)
        * [javascript-tw](https://www.facebook.com/groups/javascript.tw/)
    * download_facebook.sh 則會額外再加分析以下幾個社群
        * [hadoopintaiwan](https://www.facebook.com/groups/hadoopintaiwan/)
        * [hbase-tw](https://www.facebook.com/groups/hbase.tw/)
        * [nosql-bigdata](https://www.facebook.com/groups/423848814337101/)
        * [mongodb-tw](https://www.facebook.com/groups/142553245867411/)
3. 執行 `./bigdata_facebook.sh` , 會產生 supply-tw.csv
4. 下載 [Gephi](http://gephi.github.io/), 開啟 facebook_group_v8_20150301.gephi , 選擇匯入 supply-tw.csv
    * 習慣上我會先 lock 社群名稱的點，這樣每次產生的圖才可以做比較。
    * 若有人會使用 D3.js 的話，應該也可以使用 D3.js 來畫類似的圖。

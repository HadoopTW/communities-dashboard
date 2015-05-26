#!/bin/bash
## Note: if the access_token is not working, please go to https://developers.facebook.com/tools/explorer/ to get another one.
. config
group_id="229969580464647"
group_nm="hadoopintaiwan"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="191142874328429"
group_nm="hadoop-tw"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="289369481132604"
group_nm="hbase-tw"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="306552142710977"
group_nm="nosql-tw"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="537936816220741"
group_nm="opendata-tw"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="423848814337101"
group_nm="nosql-bigdata"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

group_id="142553245867411"
group_nm="mongodb-tw"
curl -F "access_token=$access_token" -F "batch=[{\"method\":\"GET\", \"relative_url\":\"/$group_id/members\"}]" https://graph.facebook.com > $group_nm.json
cat $group_nm.json | sed 's#,#\n#g' | sed 's#\\##g' | grep "\"id\"" | sed "s#\"id\":#\"$group_nm\"->#" > $group_nm.txt

echo "\"Target\";\"Source\"" > bigdata-tw.csv
sed 's#}##' *.txt | sed 's#->#;#' >> bigdata-tw.csv

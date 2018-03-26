#!/bin/bash

JobOne="dev_one"
JobTwo="dev_two"

java -jar jenkins-cli.jar -s http://10.0.20.30:8080 build $JobOne  --username admin --password admin

java -jar jenkins-cli.jar -s http://10.0.20.30:8080 build $JobTwo  --username admin --password admin

build_for_one=`ls -al /var/lib/jenkins/jobs/job_one/builds/ | awk '{ print $9}' | grep -o -s '[0-9]*' | sort -r | head -1`

#echo $build_for_job_one

build_for_two=`ls -al /var/lib/jenkins/jobs/job_two/builds/ | awk '{ print $9}' | grep -o -s '[0-9]*' | sort -r | head -1`

#echo $build_for_job_two

#log_file_one=$(/var/lib/jenkins/jobs/job_one/builds/$build_for_one/log)
status_one=`tail -1 /var/lib/jenkins/jobs/job_one/builds/$build_for_one/log | awk '{ print $2}'`

status_two=`tail -1 /var/lib/jenkins/jobs/job_two/builds/$build_for_two/log | awk '{ print $2}'`


cat > test.htm <<- _EOF_
<html>
<body>
<table>
<tr>
<th>JobName</th>
<th>Status</th>
</tr>
<tr>
<td>$JobOne</td>
<td>$status_one</td>
</tr>
<tr>
<td>$JobTwo</td>
<td>$status_two</td>
</tr>
</table>
</body>
</html>
_EOF_


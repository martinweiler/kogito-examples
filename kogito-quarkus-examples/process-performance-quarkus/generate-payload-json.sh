OUTPUT_FILE=payload-kafka-load.json
NO_OF_LINES=1000

rm -f ${OUTPUT_FILE}
OIFS="$IFS"
IFS=$'\n'
{
  for i in `seq 1 $NO_OF_LINES`
  do
  UUID=`uuidgen`
  CURTIME=`date '+%Y-%m-%dT%H:%M:%SZ'`
  CURTIMESHORT=`date '+%Y-%m-%d'`
  echo "{\"specversion\":\"1.0\"," \
  "\"id\":\"${UUID}\"," \
  "\"source\":\"test-${i}\"," \
  "\"type\":\"test\"," \
  "\"time\":\"${CURTIME}\"," \
  "\"data\":111}"
  done
  
} >> "${OUTPUT_FILE}"
IFS="$OIFS"


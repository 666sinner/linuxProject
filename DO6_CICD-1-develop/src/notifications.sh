TELEGRAM_BOT_TOKEN=7476924695:AAE0t6Pfy4JKrD5XRaM6IAsDsD_Mpm8sDNM
TELEGRAM_USER_ID=409103998
TIME=10

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $CI_JOB_NAME $CI_JOB_STATUS%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG%0ACommit:+$CI_COMMIT_SHA%0AStage:+$CI_JOB_NAME%0AStatus:+$CI_JOB_STATUS"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
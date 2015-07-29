FILE="$1"

if [ -z "$FILE" ]; then
  echo "./run.sh <file to server>"
  exit 1
else
  bundle install
  FILE_TO_SERVE="$FILE" bundle exec rails s
fi

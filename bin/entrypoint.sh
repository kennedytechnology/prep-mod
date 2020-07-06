set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

rails db:migrate 2>/dev/null || rails db:setup

exec "$@"
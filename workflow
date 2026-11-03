name: water reminder
on:
  schedule:
    - cron: "0 */3 * * *"
  workflow_dispatch:
jobs:
  ping:
    runs-on: ubuntu-latest
    steps:
      - name: Remind the thirsty
        env:
          WEBHOOK: ${{ secrets.WATER_WEBHOOK }}
        run: |
          ROLE="<@&1567048846364643469>"
          MSGS=(
            "DRINK WATER YOU THIRSTY BITCHES"
            "hydration check. go drink water."
            "your kidneys are filing a complaint. water. now."
            "💧 water. you. immediately."
          )
          PICK="${MSGS[$RANDOM % ${#MSGS[@]}]}"
          curl -s -H "Content-Type: application/json" \
            -d "{\"content\":\"${ROLE} ${PICK}\",\"allowed_mentions\":{\"parse\":[\"roles\"]}}" \
            "$WEBHOOK"

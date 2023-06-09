curl=`cat <<EOS
curl https://api.openai.com/v1/completions \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $2" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "I have the following updates on my online marketplace application changelog: $1. It contains version using semver, short description and date. Could you please build a nice blog post about the last month updates based on provided version level and their description focusing on major updates first.",
  "max_tokens": 3000,
  "temperature": 1.0

}' \
--insecure | jq '.choices[]'.text
EOS`

eval ${curl}

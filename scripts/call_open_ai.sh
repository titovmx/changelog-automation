echo '$0: Script Name: '$0

echo "\nInput": $1
echo "\nOutput:" 

curl=`cat <<EOS
curl https://api.openai.com/v1/completions \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $2" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "I have the following updates in my web e-commerce marketplace changelog: $1. It contains version using semver, short description and date. Could you please build a nice blog post about the last month updates based on provided version level and their description focusing on major updates first.",
  "max_tokens": 3000,
  "temperature": 1.0

}' \
--insecure
EOS`

eval ${curl}

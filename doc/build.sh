set -e


# mac下如果使用自带的sed命令需要修改为以下
sed -i 's#/doc/#/chameleon/doc/#g' "book.json"

gitbook install && gitbook build ./ ./_tmpbook/doc

# mac下如果使用自带的sed命令需要修改为以下
sed -i 's#/chameleon/doc/#/doc/#g' "book.json"


cd ./website/
npm i
npm run build
mv -f ./target/* ../_tmpbook/
cd ../

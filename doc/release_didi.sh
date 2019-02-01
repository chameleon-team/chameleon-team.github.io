set -e

GIT_SITE="git@github.com"
TEAM_NAME="didi"
PROJECT_NAME="chameleon"
sh ./check.sh

if [ ! -d "./${PROJECT_NAME}" ];then
git clone -b gh-pages ${GIT_SITE}:${TEAM_NAME}/${PROJECT_NAME}.git  --depth=1
else
cd ./${PROJECT_NAME}
git pull
cd ../
fi

cd ./website/
npm i
npm run build
cp -rf ./target/* ../${PROJECT_NAME}/
cd ../

gitbook install && gitbook build && rm -rf ./${PROJECT_NAME}/doc && mv -f ./_book ./${PROJECT_NAME}/doc

rm -rf ./${PROJECT_NAME}/doc/*.sh
rm -rf ./${PROJECT_NAME}/doc/website

cd ./${PROJECT_NAME}
git diff


read -p "你确定要推送到didi.github.io/chameleon吗[Y/y]?" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
git add .
git commit -am "help document"
git push origin gh-pages
echo "\033[36m推送完毕\033[0m"
cd ../
else
echo "你取消了推送"
cd ../
fi

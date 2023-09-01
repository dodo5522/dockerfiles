# dockerfiles

前回の手順書に記載したDockerコンテナ起動コマンドで起動したコンテナがEC2のホストOSが再起動した場合、コンテナが自動的に起動されない問題があります。
参照：Amazon Linux2 でDockerのインストール（ハンズオン）
https://cloud5.jp/amazon-linux2-docker-install/

対策
Dockerコンテナ起動コマンドに"−−restart=always"オプションを指定すれば解決できる。
コマンド比較：

#デフォルト起動
sudo docker run --name myweb -d -p 80:80 -it nginx
#restartオプション指定
sudo docker run --restart=always --name myweb -d -p 80:80 -it nginx



declare BASEDIR=.
# declare BASEDIR=$(dirname $(readlink -f $0)) #! 取得Script絶對路徑
declare ImageName="wayne168/alpine3:test"
declare ContainerName="myalpine3"

# === build docker image ===
echo "============= BUILD $ImageName , BUILD DIR=$BASEDIR ============= "
# echo "BUILD DIR=$BASEDIR"
# echo "BUILD Image=$ImageName"
docker build -t $ImageName $BASEDIR

# === Run docker image ===
echo "============= RUN $ContainerName ============= "


# * 單次執行 - 測試Container
# ! -e可設定Container系統環境變數 - https://docs.docker.com/engine/reference/run/#env-environment-variables
docker run --rm --name $ContainerName --hostname=$ContainerName -e "TZ=Asia/Taipei" -e "TEST_VAR=VVVVV" $ImageName env      # ! 帶入及顯示環境變數
docker run --rm --name $ContainerName --hostname=$ContainerName -e "TZ=Asia/Taipei" -e "TEST_VAR=VVVVV" $ImageName date     # ! 帶入環境變數及顯示日期

# * 前景執行 - 使用Shell互動
# docker run -it --rm --name $ContainerName --hostname=$ContainerName $ImageName /bin/zsh
# docker run -it --rm --name $ContainerName --hostname=$ContainerName $ImageName /bin/sh    
# docker run -it --rm --name $ContainerName --hostname=$ContainerName $ImageName /bin/bash

# * 背景執行 - 使用Exec測試
# docker run -dt --rm --name $ContainerName --hostname=$ContainerName $ImageName
# docker exec $ContainerName env    # 顯示Container環境變數
# docker exec $ContainerName date   # 顯示Container日期


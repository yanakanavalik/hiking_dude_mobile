flutter pub get
cd core
for dir in */ ; do

    echo ${dir}
    cd ${dir}
    pwd
    flutter pub get
    cd ..
    pwd
    if [ "$#" -gt 0 ]; then shift; fi
    # shift
done
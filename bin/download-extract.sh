# !/bin/bash

# Downloads and extracts VDVDE

PROFILE_PATH="./profile"

ZIPFILE="v${GIT_BRANCH}.zip"

if [ -f $ZIPFILE ]; then
  rm $ZIPFILE
fi

echo "${GITHUB_URL}/archive/$ZIPFILE"

wget -q "${GITHUB_URL}/archive/$ZIPFILE"

echo "Removing contents in $PROFILE_PATH"
rm -rf $PROFILE_PATH/*

unzip $ZIPFILE "${VDVDE_REPO}-${GIT_BRANCH}/*" -d $PROFILE_PATH

rm -r $DESTINATION_PATH
mkdir -p $DESTINATION_PATH

echo $PROFILE_PATH/${VDVDE_REPO}-${GIT_BRANCH}

cp -r $PROFILE_PATH/${VDVDE_REPO}-${GIT_BRANCH}/* $DESTINATION_PATH/.
cp -r ./xml $DESTINATION_PATH/.

# rm $ZIPFILE

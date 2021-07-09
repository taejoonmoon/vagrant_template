#!/bin/bash
# install ansbile role with user account

test -d roles || mkdir roles

git_repo=`cat requirements.yml | grep src | sed -e 's/git+ssh:\/\///g' -e 's/github.com\//github.com:/g' | awk '{ print $3 }'`
cd roles
for repo in $git_repo ; do
    repo_name=`echo $repo | cut -d"/" -f2`
    repo_dir=`echo $repo_name | sed 's/\.git$//g'`
    echo $repo
    echo $repo_name
    echo $repo_dir
    if  test -d $repo_dir ; then
        cd $repo_dir
        git pull $repo
        cd ../
    else
        git clone $repo
    fi
done
cd ../

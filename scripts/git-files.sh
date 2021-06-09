#!/bin/bash
git ls-tree -r --name-only HEAD | while read filename; do
  createdAt=`echo -e "$(git log --date=format:'%Y-%m-%d' --format="%ad" -- $filename | tail -1)"`;
  # createdBy=`echo -e "$(git log --format="%an" -- $filename | tail -1)"`;
  updatedAt=`echo -e "$(git log -1 --date=format:'%Y-%m-%d' --format="%ad"  -- $filename)"`;
  # updatedBy=`echo -e "$(git log -1 --format="%an"  -- $filename)"`;
  echo -e "$createdAt | $updatedAt | $filename";
done

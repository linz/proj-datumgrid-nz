#!/bin/sh

VERSION=`cat files/VERSION.proj-datumgrid-nz`
zip -j proj-datumgrid-nz-$VERSION files/*.proj-datumgrid-nz files/*.gsb files/*.gtx 

thegame
========================

Set S3_KEY and S3_SECRET config vars to upload files
Set TWITTER_KEY and TWITTER_SECRET config vars to your oauth info

Assets
------

Recompile when necessary - there is a git pre-commit hook that can do that:

    #!/bin/sh

    echo "Packaging assets..."
    bundle exec rake assets:precompile
    git add public/assets

But it takes forrrreevvvver... don't do it.

MIT License

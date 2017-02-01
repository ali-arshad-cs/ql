# config/initializers/refile.rb
require "refile/s3"

aws = {
    access_key_id: "AKIAJVMKVJVEFDWORMZQ",
    secret_access_key: "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",
    region: "us-west-2",
    bucket: "inwood"
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
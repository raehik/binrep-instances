# binrep-instances
Orphan instances for binrep.

binrep mostly cares about standalone data types that are exclusively used with
its type classes. However, my strongweak library lends itself to working
together with binrep. But it requires a couple of orphan instances, and adds
some non-orphan but out-of-place instances to binrep (`WeakenN` is an "ignore"
layer, which otherwise doesn't fit in binrep). It's kind of like an extension.

Such orphan instances are pulled out into this library.

## License
Provided under the MIT license. See `LICENSE` for license text.

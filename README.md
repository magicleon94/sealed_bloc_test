# sealed_bloc_test

Testing [sealed_flutter_bloc](https://pub.dev/packages/sealed_flutter_bloc) and drawing some conclusions.

The ´hybrid_sealed´ branch contains an implementation of the same use case but using the classic [flutter_bloc](https://pub.dev/packages/flutter_bloc) but using [sealed_unions](https://pub.dev/packages/sealed_unions) for the state.

The second approach is similar to the first, but doesn't kill the option to use a classic implementation, leaving the choice of applyng sealed unions only to certain use cases.

package xbt

trait Resolver {
  def search(searchString: String): JsonValue
}

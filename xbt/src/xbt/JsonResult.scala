package xbt

sealed trait JsonValue
case class JsonObject(obj: String) extends JsonValue {
  def get(key: String): Option[JsonValue]
}
case class JsonString(s: String) extends JsonValue
case class JsonNumber(i: Num) extends JsonValue
case class JsonArray(a: [JsonValue]) extends JsonValue

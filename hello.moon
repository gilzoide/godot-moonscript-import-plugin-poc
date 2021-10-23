{
  extends: 'Node'

  title_text: property { 'Hello from MoonScript!', hint: PropertyHint.MULTILINE_TEXT }

  _ready: =>
    @label = @get_node 'Label'
    @label.text = @title_text
}

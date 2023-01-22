# NOTE: This file was automatically generated
#       Any changes to this file will be overwritten.
#
#       To update:
#         * Edit app.yml
#         * Run `make src/cutback/helpers/options.cr`

# TODO: Template is ugly as sin, but output is pretty =]
#       A hash-like interface or something would be better so much better than generating all this
<%- max = app.options.map(&.name.size).max -%>

module Cutback::Helpers::Options::Properties::Base
  <%- app.options.each do |option| %>
  property <%= option.name.ljust(max) -%>
    <%- unless option.default.nil? -%>
 = <%= option.type == "string" ? "\"#{option.default}\"" : option.default -%>
    <%- else -%>
      <%- if option.type == "list" %> = [] of String<% end -%>
      <%- if option.type == "integer" %> : Int32?<% end -%>
      <%- if option.type == "string" %> : String?<% end -%>
    <%- end -%>
  <%- end %>

end

module Cutback::Helpers::Options::Properties::Prototype

  <%- app.options.each do |option| -%>
  property <%= option.name.ljust(max) -%>
    <%- case option.type
        when "bool" -%>
 : Bool?
    <%- when "string" -%>
 : String?
    <%- when "list" -%>
 : Array(String)?
    <%- when "date" -%>
 : Time?
    <%- when "integer" -%>
 : Int32?
    <%- end -%>
  <%- end -%>

end

module Cutback::Helpers::Options::Properties::Config

  include Helpers::Mappable

  macro included
    <%- app.options.each do |option| -%>
    <%= "property #{option.name} : ".ljust(max+1) -%>
      <%- case option.type
          when "bool" -%>
Bool?
      <%- when "string" -%>
String?
      <%- when "list" -%>
Array(String)?
      <%- when "date" -%>
Time?
      <%- when "integer" -%>
Int32?
      <%- end -%>
    <%- end -%>
  end

end

module Cutback::Helpers::Options::Definitions

  PATH_DELIMITER = ";" # TODO: Better place for this

  macro define_option(name, short, type)
    {% if type.id == "bool" %}
      @option_parser.on("-{{short}}", "--{{name}}",       "") {         @prototype.{{name.id}} = true }
    {% elsif type.id == "string" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value }
    {% elsif type.id == "list" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.split(/#{PATH_DELIMITER}+/) }
    {% elsif type.id == "date" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = Time.parse_utc(value, "%F") } # TODO: Helper for this
    {% elsif type.id == "integer" %}
      @option_parser.on("-{{short}}", "--{{name}} VALUE", "") { |value| @prototype.{{name.id}} = value.to_i }
    {% end %}
  end

  protected def define_options
    <%- app.options.each do |option| -%>
    define_option(<%= "#{option.name},".ljust(max+1) %> <%= option.short %>, <%= option.type %>)
    <%- end -%>
  end

end

# Usage:
# ```
# include Options::Updatable(Config)    # i.e. Update options from config
# include Options::Updatable(Prototype) # i.e. Update options from prototype
# include Options::Updatable(Options)   # i.e. Update config from options
# ```
module Cutback::Helpers::Options::Updatable(T)

  macro update_from_source(name)
    @{{name}} = source.{{name}}.not_nil! unless source.{{name}}.nil?
  end

  def update(source : T)
    <%- app.options.each do |option| -%>
    update_from_source(<%= option.name %>)
    <%- end -%>
  end

end


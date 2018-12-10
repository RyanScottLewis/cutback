# Template generator built to bin/generate for internal file generation

require "ecr"

require "./setup"
require "./generate/**"

macro generate(path)
  String.build { |io| ECR.embed({{path}}, io) }
end

macro generate_templates(hash, paths)
  {% for path, index in paths %}
    {{hash}}[File.basename({{path}})] = generate({{path}})
  {% end %}
end

if ARGV.size != 2
  puts "Usage: #{PROGRAM_NAME} INPUT OUTPUT"
  exit 1
end

class String
  def indent(level=2)
    lines.map { |line| "#{" " * level}#{line}" }.join("\n")
  end
end

input       = ARGV[0]
output      = ARGV[1]
app         = Generate::Definition::Root.load("app.yml")
files       = {} of String => String
path        = File.basename(input)
controllers = Cutback::Controller.all.sort_by(&.name)

app.for = :help if File.basename(input) == "help"
app.for = :man  if File.extname(input) =~ /\.\d/

generate_templates(files, [
  "templates/cutback.1",
  "templates/cutback.5",
  "templates/help",
  "templates/version",
  "templates/README.md",
])

unless files.has_key?(path)
  puts "Error: Unknown template '#{path}'"
  exit 1
end

data = files[path]

File.open(output, "w+") do |io|
  io.puts(data)
end


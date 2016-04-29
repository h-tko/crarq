defmodule ChildRearingQuestion.YamlManager do

  @yaml_file_dir "./yaml/"
  @yaml_ext ".yml"

  def get(filename) do

    path = File.cwd! |> Path.join(@yaml_file_dir <> filename <> @yaml_ext)

    YamlElixir.read_from_file path
  end
end

def convert_str_to_time(start)
  hour, minute, second = start.split(":").map(&:to_i)
  seconds = second + (minute*60) + (hour*60*60)
end

def generate_gif(vid, start_sec, total_sec, fps = 10, scale = 600, output_name = "output")
  system("ffmpeg -y -ss #{start_sec} -t #{total_sec} -i #{vid} -vf fps=#{fps},scale=#{scale}:-1:flags=lanczos,palettegen palette.png")
  system("ffmpeg -ss #{start_sec} -t #{total_sec} -i #{vid} -i palette.png -filter_complex \"fps=#{fps},scale=#{scale}:-1:flags=lanczos[x];[x][1:v]paletteuse\" #{output_name}.gif")
  system("rm pallete.png")
end

filename = ARGV[0]
start = ARGV[1]
fin = ARGV[2]
fps = ARGV[3]
scale = ARGV[4]
output_name = ARGV[5]

start_in_sec = convert_str_to_time(start)
total_secs = convert_str_to_time(fin) - convert_str_to_time(start)

if fps && scale && output_name
  generate_gif(filename, start_in_sec, total_secs, fps, scale, output_name)
else
  generate_gif(filename, start_in_sec, total_secs)
end
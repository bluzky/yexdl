# Yexdl


> Yexdl is a simple library that help you to get direct mp4 video link from youtube video
> It's a small module so you can just copy and use in your project without install this whole package

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `yexdl` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:yexdl, "~> 0.1.0"}
  ]
end
```

Hexdocs [https://hexdocs.pm/yexdl](https://hexdocs.pm/yexdl**.



## Usage

Query all available direct links for a video

Each video quality and format has a different link

**Example**

```elixir
iex> Yexdl.get_all_source("txuGKmLDTtk")
[
  %{
     "itag" => "17",
     "quality" => "small",
     "type" => "video/3gpp; codecs='mp4v.20.3, mp4a.40.2'",
     "url" => "https://r7---sn-8pxuuxa-nbol7.googlevideo.com/v..."
  },
  %{
     "itag" => "12",
     "quality" => "medium",
     "type" => "video/mp4; codecs='mp4v.20.3, mp4a.40.2'",
     "url" => "https://r7---sn-8pxuuxa-nbol7.googlevideo.com/v..."
   }
]
```


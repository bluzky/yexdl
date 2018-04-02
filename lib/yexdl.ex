defmodule Yexdl do
  @moduledoc """
  Yexdl provide function for querying all direct links (mp4 links) with all supported qualities from youtube video id.
  """

  def get_source(video_id, quality) do
  end

  @doc """
  Query all available direct links for a video

  Each video quality and format has a different link

  ## Example

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

  """
  def get_all_source(video_id) do
    fetch_video_info(video_id)
    |> case do
      {:ok, info} ->
        decode_stream_map(info["url_encoded_fmt_stream_map"] || "")

      {:error, reason} = err ->
        err
    end
  end

  defp fetch_video_info(video_id) do
    :hackney.request(
      :get,
      "https://www.youtube.com/get_video_info?video_id=#{video_id}",
      follow_redirect: true,
      max_redirect: 5,
      force_redirect: true
    )
    |> case do
      {:ok, status_code, headers} ->
        {:error, :empty_data}

      {:ok, status_code, headers, client} ->
        case :hackney.body(client) do
          {:ok, body} ->
            {:ok, URI.decode_query(body)}

          err ->
            err
        end

      {:ok, id} ->
        {:error, :empty_data}

      {:error, reason} = err ->
        err
    end
  end

  defp decode_stream_map(data_str) do
    data_str
    |> String.split(",")
    |> Enum.map(fn item ->
      URI.decode_query(item)
    end)
  end
end

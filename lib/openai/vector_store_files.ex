defmodule OpenAI.VectorStores.Files do
  @moduledoc false
  alias OpenAI.Client
  alias OpenAI.Config

  @base_url "/v1/vector_stores"

  def url(), do: @base_url
  def url(vector_store_id), do: "#{@base_url}/#{vector_store_id}/files"
  def url(vector_store_id, file_id), do: "#{@base_url}/#{vector_store_id}/files/#{file_id}"

  def create(vector_store_id, params, config \\ %Config{}) do
    url(vector_store_id)
    |> Client.api_post(params, config)
  end

  def fetch(vector_store_id, config \\ %Config{}) do
    url(vector_store_id)
    |> Client.api_get(config)
  end

  def fetch_by_id(vector_store_id, file_id, config \\ %Config{}) do
    url(vector_store_id, file_id)
    |> Client.api_get(config)
  end

  def delete(vector_store_id, file_id, config \\ %Config{}) do
    url(vector_store_id, file_id)
    |> Client.api_delete(config)
  end
end

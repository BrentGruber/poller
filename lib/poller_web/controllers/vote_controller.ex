defmodule PollerWeb.VoteController do
  use PollerWeb, :controller

  alias Poller.Polls
  alias Poller.Polls.Vote
  alias Poller.Endpoint

  action_fallback PollerWeb.FallbackController

  # def create(conn, %{"vote" => vote_params}) do
  #   with {:ok, %Vote{} = vote} <- Polls.create_vote(vote_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.vote_path(conn, :show, vote))
  #     |> render("show.json", vote: vote)
  #   end
  # end

  def create(conn, %{"id" => id, "vote" => %{"option_id" => option_id}}) do
    option = Polls.get_option!(option_id)

    with {:ok, %Vote{} = vote} <- Polls.create_vote(option) do
      Endpoint.broadcast!("poll:" <> id, "new_vote", %{option_id: option.id})

      conn
      |> put_status(:created)
      |> render("show.json", vote: vote)
    end
  end

end

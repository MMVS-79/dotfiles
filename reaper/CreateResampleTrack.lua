-- Create Resample Track
-- Sets up a new track to record the selected track's output

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)

local selTrack = reaper.GetSelectedTrack(0, 0)
if not selTrack then
  reaper.ShowMessageBox("Please select a track to resample.", "No Track Selected", 0)
  return
end

local trackIndex = reaper.GetMediaTrackInfo_Value(selTrack, "IP_TRACKNUMBER")
reaper.InsertTrackAtIndex(trackIndex, true)
local newTrack = reaper.GetTrack(0, trackIndex)

reaper.GetSetMediaTrackInfo_String(newTrack, "P_NAME", "Resample Track", true)
reaper.CreateTrackSend(selTrack, newTrack)
reaper.SetMediaTrackInfo_Value(newTrack, "I_RECARM", 1)
reaper.SetMediaTrackInfo_Value(newTrack, "I_RECMODE", 1)
reaper.SetMediaTrackInfo_Value(newTrack, "I_RECINPUT", 1024)
reaper.SetMediaTrackInfo_Value(newTrack, "B_MAINSEND", 1)

reaper.TrackList_AdjustWindows(false)
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Create resample track", -1)


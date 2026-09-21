folder_name = "AxelHub/_Counter_ST.JSON"
repeat task.wait(.3)
if isfolder("AxelHub") then
            if isfile(folder_name) then
                executetime = tonumber(game:service('HttpService'):JSONDecode(readfile(folder_name)))
                writefile(folder_name, game:service('HttpService'):JSONEncode(executetime + 1))
                areufr = true
            else
                writefile(folder_name, game:service('HttpService'):JSONEncode(1))
                executetime = tonumber(game:service('HttpService'):JSONDecode(readfile(folder_name)))
                areufr = true
            end
        else
        makefolder("AxelHub")
        end
until areufr

function sendwebhook(values)

if Webhook_Link ~= "" then
                pcall(function()
local url = Webhook_Link
                    local data = {
                    ["content"] = popathing,
                    ["embeds"] = {
                        {   
                            ["author"] = {
                                ["name"] = "",
                            },
                            ["type"] = "rich",
                            ["title"] = "Axel Hub Notification",
                            ["color"] = tonumber(14177041),
                            ["fields"] = {
            {
                                    ["name"] = "Account : ".."||"..game.Players.LocalPlayer.Name.."||",
                                    ["value"] = values
                                },
        },
                            ['description'] = 'https://discord.com/invite/axelhub',
                            color = 0xf3e161,
        footer = {
            text = "By Axel Hub",
            icon_url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png"
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        thumbnail = {
            url = "https://i.postimg.cc/JzBQczg1/axel-hub-2-removebg-preview.png"
        },
        image = {
            url = "https://tr.rbxcdn.com/180DAY-03cf3a4c472ab4edad95ff2fe74b9355/768/432/Image/Webp/noFilter"
        }
                        }
                    }
                }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                
                local headers = {
                    ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(abcdef)
                end)
                else
                    print("Invaild Url")
            end

        end

Webhook_Link = "https://discord.com/api/webhooks/1551211763121397852/cACO8cF7WOY-LoAmF5P1CWftqzZr2M-p9988QJgJbInCPFqPYqFrlhtx-ueLWO1Ko2CC"
sendwebhook("Steal An Egg Has Been Executed\nExecuted Counted : "..executetime)
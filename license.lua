local js = require "js"

local document = js.global.document
local window   = js.global.window

local function Element(Id)
   return document:getElementById(Id)
end

local function Value(Id)
   return Element(Id).value
end

local function Encode(Text)
   return window:encodeURIComponent(Text)
end

local function Submit()
   local IguanaId   = Value("iguana_id")
   local CustomerId = Value("customer_id")
   local Channels   = Value("channels")

   local Query =
      "license?id=" .. Encode(IguanaId) ..
      "&customer_id=" .. Encode(CustomerId) ..
      "&channels=" .. Encode(Channels) ..
      "&iguanax=" .. tostring(Element("iguana_x").checked)

   print(Query);
   window.location.href = Query
end


local function Start()
   print("DOM is ready")

   local Button = Element("generate_button")

   Button:addEventListener("click", function()
      Submit();
   end)
end

if document.readyState == "loading" then
   document:addEventListener("DOMContentLoaded", Start)
else
   Start()
end

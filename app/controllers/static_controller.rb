class StaticController < ApplicationController
    def index
        
        @btcusd = Ticker.where(name: "btcusd") 
        @ltcusd = Ticker.where(name: "ltcusd") 
        @ethusd = Ticker.where(name: "ethusd") 
        @zecusd = Ticker.where(name: "zecusd") 
        @xmrusd = Ticker.where(name: "xmrusd") 
        @dshusd = Ticker.where(name: "dshusd") 
        @xrpusd = Ticker.where(name: "xrpusd") 
        @iotusd = Ticker.where(name: "iotusd") 
        @eosusd = Ticker.where(name: "eosusd")
        @sanusd = Ticker.where(name: "sanusd")
        @omgusd = Ticker.where(name: "omgusd")
        @bchusd = Ticker.where(name: "bchusd")
        @neousd = Ticker.where(name: "neousd")
        @etpusd = Ticker.where(name: "etpusd")
        @edousd = Ticker.where(name: "edousd")
        @btgusd = Ticker.where(name: "btgusd")
        @rrtusd = Ticker.where(name: "rrtusd")
        @qtmusd = Ticker.where(name: "qtmusd")
        @avtusd = Ticker.where(name: "avtusd")
        @datusd = Ticker.where(name: "datusd")
        #@yywusd = Ticker.where(name: "yywusd")
        #@gntusd = Ticker.where(name: "gntusd")
        #@sntusd = Ticker.where(name: "sntusd")
        
        @colorsArray = ["#8e5ea2", "#3cba9f","#e8c3b9","#c45850", "#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"]
        @vremenaLabels = []
        @btcusd.pluck(:created_at).each do |x|
            @vremenaLabels << x.strftime("%I").to_i
        end
        
        
        @btcusdchart = @btcusd.pluck(:last_price)
        @ltcusdchart = @ltcusd.pluck(:last_price)
        @ethusdchart = @ethusd.pluck(:last_price)
        @zecusdchart = @zecusd.pluck(:last_price)
        @xmrusdchart = @xmrusd.pluck(:last_price)
        @dshusdchart = @dshusd.pluck(:last_price)
        @xrpusdchart = @xrpusd.pluck(:last_price)
        @iotusdchart = @iotusd.pluck(:last_price)
        @eosusdchart = @eosusd.pluck(:last_price)
        @sanusdchart = @sanusd.pluck(:last_price)
        @omgusdchart = @omgusd.pluck(:last_price)
        @bchusdchart = @bchusd.pluck(:last_price)
        @neousdchart = @neousd.pluck(:last_price)
        @etpusdchart = @etpusd.pluck(:last_price)
        @edousdchart = @edousd.pluck(:last_price)
        @btgusdchart = @btgusd.pluck(:last_price)
        @rrtusdchart = @rrtusd.pluck(:last_price)
        @qtmusdchart = @qtmusd.pluck(:last_price)
        @avtusdchart = @avtusd.pluck(:last_price)
        @datusdchart = @datusd.pluck(:last_price)
        #@yywusdchart = @yywusd.pluck(:last_price)
        #@gntusdchart = @gntusd.pluck(:last_price)
        #@sntusdchart = @sntusd.pluck(:last_price)
        
        
        
        @sviPricesi = [
                        [ @btcusdchart, "btc"], 
                        [ @ltcusdchart, "ltc"], 
                        [ @ethusdchart, "eth"],
                        [ @zecusdchart, "zec"], 
                        [ @xmrusdchart, "xmr"],
                        [ @dshusdchart, "dsh"],
                        [ @xrpusdchart, "xrp"], 
                        [ @iotusdchart, "iot"], 
                        [ @eosusdchart, "eos"], 
                        [ @sanusdchart, "san"],
                        [ @omgusdchart, "omg"],
                        [ @bchusdchart, "bch"],
                        [ @neousdchart, "neo"],
                        [ @etpusdchart, "eot"],
                        [ @edousdchart, "edo"],
                        [ @btgusdchart, "btg"],
                        [ @rrtusdchart, "rrt"],
                        [ @qtmusdchart, "qtm"],
                        [ @avtusdchart, "avt"],
                        [ @datusdchart, "dat"]
                        #,
                        #[ @yywusdchart, "yyw"]
                        #,
                        #[ @gntusdchart, "gnt"],
                        #[ @sntusdchart, "snt"]
                        
                        ]
        
        @sviTickeri = [@btcusd, @ltcusd, @ethusd, @zecusd, @xmrusd, @dshusd, @iotusd, @eosusd, @sanusd,
                        @omgusd,
                        @bchusd,
                        @neousd,
                        @etpusd,
                        @edousd,
                        @btgusd,
                        @rrtusd,
                        @qtmusd,
                        @avtusd,
                        @datusd
                        #,
                        #@yywusd
                        #,
                        #@gntusd,
                        #@sntusd
                        ]
        
        @podignutiPrice = []
        @podignutiVolume = []
        
        @sviTickeri.each do |tickerArray|
            
            tickerArray.each_with_index do |ticker, index|
            
                if index == 0
                    next
                else
                    if ticker[:last_price]/1.01 > tickerArray[index-1][:last_price]
                        @podignutiPrice << ticker
                    end
                    if ticker[:volume]/1.01 > tickerArray[index-1][:volume]
                        @podignutiVolume << ticker
                    end
                end

            end
            
        end
        
        @I500 = 1500
        
    end
    
    def pocni
        require 'uri'
        require 'net/http'
        ##########################
            urlBTC = URI("https://api.bitfinex.com/v1/pubticker/btcusd")
            urlLTC = URI("https://api.bitfinex.com/v1/pubticker/ltcusd")
            urlETH = URI("https://api.bitfinex.com/v1/pubticker/ethusd")
            urlZEC = URI("https://api.bitfinex.com/v1/pubticker/zecusd")
            urlXMR = URI("https://api.bitfinex.com/v1/pubticker/xmrusd")
            urlDAS = URI("https://api.bitfinex.com/v1/pubticker/dshusd")
            urlXRP = URI("https://api.bitfinex.com/v1/pubticker/xrpusd")
            urlIOT = URI("https://api.bitfinex.com/v1/pubticker/iotusd")
            urlEOS = URI("https://api.bitfinex.com/v1/pubticker/eosusd")
            urlSAN = URI("https://api.bitfinex.com/v1/pubticker/sanusd")
            urlOMG = URI("https://api.bitfinex.com/v1/pubticker/omgusd")
            urlBCH = URI("https://api.bitfinex.com/v1/pubticker/bchusd")
            urlNEO = URI("https://api.bitfinex.com/v1/pubticker/neousd")
            urlETP = URI("https://api.bitfinex.com/v1/pubticker/etpusd")
            urlEDO = URI("https://api.bitfinex.com/v1/pubticker/edousd")
            urlBTG = URI("https://api.bitfinex.com/v1/pubticker/btgusd")
            urlRRT = URI("https://api.bitfinex.com/v1/pubticker/rrtusd")
            urlQTM = URI("https://api.bitfinex.com/v1/pubticker/qtmusd")
            urlAVT = URI("https://api.bitfinex.com/v1/pubticker/avtusd")
            urlDAT = URI("https://api.bitfinex.com/v1/pubticker/datusd")
            #urlYYW = URI("https://api.bitfinex.com/v1/pubticker/yywusd")
            #urlGNT = URI("https://api.bitfinex.com/v1/pubticker/gntusd")
            #urlSNT = URI("https://api.bitfinex.com/v1/pubticker/sntusd")
            
            urls =  [
                    urlBTC, 
                    urlLTC,
                    urlETH,
                    urlZEC,
                    urlXMR,
                    urlDAS,
                    urlXRP,
                    urlIOT,
                    urlEOS,
                    urlSAN,
                    urlOMG,
                    urlBCH,
                    urlNEO,
                    urlETP,
                    urlEDO,
                    urlBTG,
                    urlRRT,
                    urlQTM,
                    urlAVT,
                    urlDAT
                    #,
                    #urlYYW
                    #,
                    #urlGNT,
                    #urlSNT
                    ]
            
            @tickerARRAY = []
            
            urls.each do |ticker|
            
                http = Net::HTTP.new(ticker.host, ticker.port)
                http.use_ssl = true
                puts ticker
                request = Net::HTTP::Get.new(ticker)
                
                response = http.request(request)
                last_price = response.read_body.scan(/"last_price":"([\d]*.[\d]*)/)[0][0]
                volume = response.read_body.scan(/"volume":"([\d]*)/)[0][0]
                path1 = ticker.path
                
                path = path1.split(//).last(6).join
                
                hash = {}
                
                hash[:path] = path.to_s
                hash[:volume] = volume.to_i
                hash [:last_price] = last_price.to_f
                
                @tickerARRAY << hash
                
            
            end
            
            @tickerARRAY.each do |ticker|
            
            Ticker.create!(last_price: ticker[:last_price], volume: ticker[:volume], name: ticker[:path])
                
            end
        
        izbrisi_sve_preko_48h
        
        ##########################
        
        respond_to do |format|
                format.html
                format.js {  }
            end
    end
    
    def izbrisi_sve_preko_48h
    
        Ticker.where("created_at < ?", 48.hours.ago).delete_all      
    
    end
    
    def izbrisi
        
        Ticker.delete_all
        
        respond_to do |format|
                format.html
                format.js {  }
            end
    end
    
    def update
        require 'uri'
        require 'net/http'
        ##########################
            urlBTC = URI("https://api.bitfinex.com/v1/pubticker/btcusd")
            urlLTC = URI("https://api.bitfinex.com/v1/pubticker/ltcusd")
            urlETH = URI("https://api.bitfinex.com/v1/pubticker/ethusd")
            urlZEC = URI("https://api.bitfinex.com/v1/pubticker/zecusd")
            urlXMR = URI("https://api.bitfinex.com/v1/pubticker/xmrusd")
            urlDAS = URI("https://api.bitfinex.com/v1/pubticker/dshusd")
            urlXRP = URI("https://api.bitfinex.com/v1/pubticker/xrpusd")
            urlIOT = URI("https://api.bitfinex.com/v1/pubticker/iotusd")
            urlEOS = URI("https://api.bitfinex.com/v1/pubticker/eosusd")
            urlSAN = URI("https://api.bitfinex.com/v1/pubticker/sanusd")
            urlOMG = URI("https://api.bitfinex.com/v1/pubticker/omgusd")
            urlBCH = URI("https://api.bitfinex.com/v1/pubticker/bchusd")
            urlNEO = URI("https://api.bitfinex.com/v1/pubticker/neousd")
            urlETP = URI("https://api.bitfinex.com/v1/pubticker/etpusd")
            urlEDO = URI("https://api.bitfinex.com/v1/pubticker/edousd")
            urlBTG = URI("https://api.bitfinex.com/v1/pubticker/btgusd")
            urlRRT = URI("https://api.bitfinex.com/v1/pubticker/rrtusd")
            urlQTM = URI("https://api.bitfinex.com/v1/pubticker/qtmusd")
            urlAVT = URI("https://api.bitfinex.com/v1/pubticker/avtusd")
            urlDAT = URI("https://api.bitfinex.com/v1/pubticker/datusd")
            #urlYYW = URI("https://api.bitfinex.com/v1/pubticker/yywusd")
            #urlGNT = URI("https://api.bitfinex.com/v1/pubticker/gntusd")
            #urlSNT = URI("https://api.bitfinex.com/v1/pubticker/sntusd")
            
            urls =  [
                    urlBTC, 
                    urlLTC,
                    urlETH,
                    urlZEC,
                    urlXMR,
                    urlDAS,
                    urlXRP,
                    urlIOT,
                    urlEOS,
                    urlSAN,
                    urlOMG,
                    urlBCH,
                    urlNEO,
                    urlETP,
                    urlEDO,
                    urlBTG,
                    urlRRT,
                    urlQTM,
                    urlAVT,
                    urlDAT
                    #,
                    #urlYYW
                    #,
                    #urlGNT,
                    #urlSNT
                    ]
            
            @tickerARRAY = []
            
            urls.each do |ticker|
            
                http = Net::HTTP.new(ticker.host, ticker.port)
                http.use_ssl = true
                puts ticker
                request = Net::HTTP::Get.new(ticker)
                
                response = http.request(request)
                last_price = response.read_body.scan(/"last_price":"([\d]*.[\d]*)/)[0][0]
                volume = response.read_body.scan(/"volume":"([\d]*)/)[0][0]
                path1 = ticker.path
                
                path = path1.split(//).last(6).join
                
                hash = {}
                
                hash[:path] = path.to_s
                hash[:volume] = volume.to_i
                hash [:last_price] = last_price.to_f
                
                @tickerARRAY << hash
                
            
            end
            
            @tickerARRAY.each do |ticker|
            
            Ticker.create!(last_price: ticker[:last_price], volume: ticker[:volume], name: ticker[:path])
                
            end
        
        izbrisi_sve_preko_48h
        
        ##########################
        
        respond_to do |format|
                format.html
                format.js {  }
            end
    end
    
end

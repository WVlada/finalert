class StaticController < ApplicationController
    def index
        
        @btcusd = Ticker.where(name: "btcusd").order(:created_at) 
        @ltcusd = Ticker.where(name: "ltcusd").order(:created_at)
        @ethusd = Ticker.where(name: "ethusd").order(:created_at) 
        @zecusd = Ticker.where(name: "zecusd").order(:created_at) 
        @xmrusd = Ticker.where(name: "xmrusd").order(:created_at) 
        @dshusd = Ticker.where(name: "dshusd").order(:created_at) 
        @xrpusd = Ticker.where(name: "xrpusd").order(:created_at) 
        @iotusd = Ticker.where(name: "iotusd").order(:created_at) 
        @eosusd = Ticker.where(name: "eosusd").order(:created_at)
        @sanusd = Ticker.where(name: "sanusd").order(:created_at)
        @omgusd = Ticker.where(name: "omgusd").order(:created_at)
        #@bchusd = Ticker.where(name: "bchusd").order(:created_at)
        @neousd = Ticker.where(name: "neousd").order(:created_at)
        #@etpusd = Ticker.where(name: "etpusd").order(:created_at)
        #@edousd = Ticker.where(name: "edousd").order(:created_at)
        #@btgusd = Ticker.where(name: "btgusd").order(:created_at)
        #@rrtusd = Ticker.where(name: "rrtusd").order(:created_at)
        @qtmusd = Ticker.where(name: "qtmusd").order(:created_at)
        #@avtusd = Ticker.where(name: "avtusd").order(:created_at)
        #@datusd = Ticker.where(name: "datusd").order(:created_at)
        #@yywusd = Ticker.where(name: "yywusd")
        #@gntusd = Ticker.where(name: "gntusd")
        #@sntusd = Ticker.where(name: "sntusd")
        
        @colorsArray = ["#8e5ea2", "#3cba9f","#e8c3b9","#c45850", "#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#FAFE52", "#D7DC09", "#DD9309", "#FF472F", "#CD2684", "#E56AB0","#4F31B1", "#B09EE8", "#23BC57", "#97ECB4"]
        @vremenaLabels = []
        @btcusd.pluck(:created_at).each do |x|
            @vremenaLabels << x.strftime("%I").to_i
        end
        
        
         @btcusdchartNormal = @btcusd.pluck(:last_price)
         @ltcusdchartNormal = @ltcusd.pluck(:last_price)
         @ethusdchartNormal = @ethusd.pluck(:last_price)
         @zecusdchartNormal = @zecusd.pluck(:last_price)
         @xmrusdchartNormal = @xmrusd.pluck(:last_price)
         @dshusdchartNormal = @dshusd.pluck(:last_price)
         @xrpusdchartNormal = @xrpusd.pluck(:last_price)
         @iotusdchartNormal = @iotusd.pluck(:last_price)
         @eosusdchartNormal = @eosusd.pluck(:last_price)
         @sanusdchartNormal = @sanusd.pluck(:last_price)
         @omgusdchartNormal = @omgusd.pluck(:last_price)
        # @bchusdchart = @bchusd.pluck(:last_price)
         @neousdchartNormal = @neousd.pluck(:last_price)
        # @etpusdchart = @etpusd.pluck(:last_price)
        # @edousdchart = @edousd.pluck(:last_price)
        # @btgusdchart = @btgusd.pluck(:last_price)
        # @rrtusdchart = @rrtusd.pluck(:last_price)
         @qtmusdchartNormal = @qtmusd.pluck(:last_price)
        # @avtusdchart = @avtusd.pluck(:last_price)
        # @datusdchart = @datusd.pluck(:last_price)
        #@yywusdchart = @yywusd.pluck(:last_price)
        #@gntusdchart = @gntusd.pluck(:last_price)
        #@sntusdchart = @sntusd.pluck(:last_price)
        
        ############### Percent ######################
        @btcusdchart = @btcusd.pluck(:last_price_percent)
        @ltcusdchart = @ltcusd.pluck(:last_price_percent)
        @ethusdchart = @ethusd.pluck(:last_price_percent)
        @zecusdchart = @zecusd.pluck(:last_price_percent)
        @xmrusdchart = @xmrusd.pluck(:last_price_percent)
        @dshusdchart = @dshusd.pluck(:last_price_percent)
        @xrpusdchart = @xrpusd.pluck(:last_price_percent)
        @iotusdchart = @iotusd.pluck(:last_price_percent)
        @eosusdchart = @eosusd.pluck(:last_price_percent)
        @sanusdchart = @sanusd.pluck(:last_price_percent)
        @omgusdchart = @omgusd.pluck(:last_price_percent)
        #@bchusdchart = @bchusd.pluck(:last_price_percent)
        @neousdchart = @neousd.pluck(:last_price_percent)
        #@etpusdchart = @etpusd.pluck(:last_price_percent)
        #@edousdchart = @edousd.pluck(:last_price_percent)
        #@btgusdchart = @btgusd.pluck(:last_price_percent)
        #@rrtusdchart = @rrtusd.pluck(:last_price_percent)
        @qtmusdchart = @qtmusd.pluck(:last_price_percent)
        #@avtusdchart = @avtusd.pluck(:last_price_percent)
        #@datusdchart = @datusd.pluck(:last_price_percent)
        #@yywusdchart = @yywusd.pluck(:last_price_percent)
        #@gntusdchart = @gntusd.pluck(:last_price_percent)
        #@sntusdchart = @sntusd.pluck(:last_price_percent)
        ##############################################
        
        @sviPricesiNormal = [
                        [ @btcusdchartNormal, "btc"], 
                        [ @ltcusdchartNormal, "ltc"], 
                        [ @ethusdchartNormal, "eth"],
                        [ @zecusdchartNormal, "zec"], 
                        [ @xmrusdchartNormal, "xmr"],
                        [ @dshusdchartNormal, "dsh"],
                        [ @xrpusdchartNormal, "xrp"], 
                        [ @iotusdchartNormal, "iot"], 
                        [ @eosusdchartNormal, "eos"], 
                        [ @sanusdchartNormal, "san"],
                        [ @omgusdchartNormal, "omg"],
                        #[ @bchusdchart, "bch"],
                        [ @neousdchartNormal, "neo"],
                        #[ @etpusdchart, "eot"],
                        #[ @edousdchart, "edo"],
                        #[ @btgusdchart, "btg"],
                        #[ @rrtusdchart, "rrt"],
                        [ @qtmusdchartNormal, "qtm"]
                        #[ @avtusdchart, "avt"],
                        #[ @datusdchart, "dat"]
                        #,
                        #[ @yywusdchart, "yyw"]
                        #,
                        #[ @gntusdchart, "gnt"],
                        #[ @sntusdchart, "snt"]
                        
                        ]
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
                        #[ @bchusdchart, "bch"],
                        [ @neousdchart, "neo"],
                        #[ @etpusdchart, "eot"],
                        #[ @edousdchart, "edo"],
                        #[ @btgusdchart, "btg"],
                        #[ @rrtusdchart, "rrt"],
                        [ @qtmusdchart, "qtm"]
                        #[ @avtusdchart, "avt"],
                        #[ @datusdchart, "dat"]
                        #,
                        #[ @yywusdchart, "yyw"]
                        #,
                        #[ @gntusdchart, "gnt"],
                        #[ @sntusdchart, "snt"]
                        
                        ]
        
        @sviTickeri = [@btcusd, @ltcusd, @ethusd, @zecusd, @xmrusd, @dshusd, @iotusd, @eosusd, @sanusd,
                        @omgusd,
                        #@bchusd,
                        @neousd,
                        #@etpusd,
                        #@edousd,
                        #@btgusd,
                        #@rrtusd,
                        @qtmusd#,
                        #@avtusd,
                        #@datusd
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
            #urlBCH = URI("https://api.bitfinex.com/v1/pubticker/bchusd")
            urlNEO = URI("https://api.bitfinex.com/v1/pubticker/neousd")
            #urlETP = URI("https://api.bitfinex.com/v1/pubticker/etpusd")
            #urlEDO = URI("https://api.bitfinex.com/v1/pubticker/edousd")
            #urlBTG = URI("https://api.bitfinex.com/v1/pubticker/btgusd")
            #urlRRT = URI("https://api.bitfinex.com/v1/pubticker/rrtusd")
            urlQTM = URI("https://api.bitfinex.com/v1/pubticker/qtmusd")
            #urlAVT = URI("https://api.bitfinex.com/v1/pubticker/avtusd")
            #urlDAT = URI("https://api.bitfinex.com/v1/pubticker/datusd")
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
                    #urlBCH,
                    urlNEO,
                    #urlETP,
                    #urlEDO,
                    #urlBTG,
                    #urlRRT,
                    urlQTM#,
                    #urlAVT,
                    #urlDAT
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
            
            @tickerARRAY.each_with_index do |ticker, index|
                
                if Ticker.where(name: ticker[:path]).last != nil
                    
                    last_price_percent = ((ticker[:last_price]/Ticker.where(name: ticker[:path]).last.last_price) - 1) * 100
                    
                else
                    last_price_percent = 0
                
                end
                
                Ticker.create!(last_price: ticker[:last_price], last_price_percent: last_price_percent, volume: ticker[:volume], name: ticker[:path])
                
            end
        
        izbrisi_sve_preko_48h
        #(@tickerARRAY)
        ##########################
        
        respond_to do |format|
                format.html
                format.js {  }
            end
    end
    
    def posalji_alert(ticker_za_slanje)
        
        #attr_accessor :name, :email, :subject, :body
        Message.create(name: "cccc", email: "odavde", body: "ticker_za_slanje")
    
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
    
    #def update
    #     require 'uri'
    #     require 'net/http'
    #     ##########################
    #         urlBTC = URI("https://api.bitfinex.com/v1/pubticker/btcusd")
    #         urlLTC = URI("https://api.bitfinex.com/v1/pubticker/ltcusd")
    #         urlETH = URI("https://api.bitfinex.com/v1/pubticker/ethusd")
    #         urlZEC = URI("https://api.bitfinex.com/v1/pubticker/zecusd")
    #         urlXMR = URI("https://api.bitfinex.com/v1/pubticker/xmrusd")
    #         urlDAS = URI("https://api.bitfinex.com/v1/pubticker/dshusd")
    #         urlXRP = URI("https://api.bitfinex.com/v1/pubticker/xrpusd")
    #         urlIOT = URI("https://api.bitfinex.com/v1/pubticker/iotusd")
    #         urlEOS = URI("https://api.bitfinex.com/v1/pubticker/eosusd")
    #         urlSAN = URI("https://api.bitfinex.com/v1/pubticker/sanusd")
    #         urlOMG = URI("https://api.bitfinex.com/v1/pubticker/omgusd")
    #         urlBCH = URI("https://api.bitfinex.com/v1/pubticker/bchusd")
    #         urlNEO = URI("https://api.bitfinex.com/v1/pubticker/neousd")
    #         urlETP = URI("https://api.bitfinex.com/v1/pubticker/etpusd")
    #         urlEDO = URI("https://api.bitfinex.com/v1/pubticker/edousd")
    #         urlBTG = URI("https://api.bitfinex.com/v1/pubticker/btgusd")
    #         urlRRT = URI("https://api.bitfinex.com/v1/pubticker/rrtusd")
    #         urlQTM = URI("https://api.bitfinex.com/v1/pubticker/qtmusd")
    #         urlAVT = URI("https://api.bitfinex.com/v1/pubticker/avtusd")
    #         urlDAT = URI("https://api.bitfinex.com/v1/pubticker/datusd")
    #         #urlYYW = URI("https://api.bitfinex.com/v1/pubticker/yywusd")
    #         #urlGNT = URI("https://api.bitfinex.com/v1/pubticker/gntusd")
    #         #urlSNT = URI("https://api.bitfinex.com/v1/pubticker/sntusd")
            
    #         urls =  [
    #                 urlBTC, 
    #                 urlLTC,
    #                 urlETH,
    #                 urlZEC,
    #                 urlXMR,
    #                 urlDAS,
    #                 urlXRP,
    #                 urlIOT,
    #                 urlEOS,
    #                 urlSAN,
    #                 urlOMG,
    #                 urlBCH,
    #                 urlNEO,
    #                 urlETP,
    #                 urlEDO,
    #                 urlBTG,
    #                 urlRRT,
    #                 urlQTM,
    #                 urlAVT,
    #                 urlDAT
    #                 #,
    #                 #urlYYW
    #                 #,
    #                 #urlGNT,
    #                 #urlSNT
    #                 ]
            
    #         @tickerARRAY = []
            
    #         urls.each do |ticker|
            
    #             http = Net::HTTP.new(ticker.host, ticker.port)
    #             http.use_ssl = true
    #             puts ticker
    #             request = Net::HTTP::Get.new(ticker)
                
    #             response = http.request(request)
    #             last_price = response.read_body.scan(/"last_price":"([\d]*.[\d]*)/)[0][0]
    #             volume = response.read_body.scan(/"volume":"([\d]*)/)[0][0]
    #             path1 = ticker.path
                
    #             path = path1.split(//).last(6).join
                
    #             hash = {}
                
    #             hash[:path] = path.to_s
    #             hash[:volume] = volume.to_i
    #             hash [:last_price] = last_price.to_f
                
    #             @tickerARRAY << hash
                
            
    #         end
            
    #         @tickerARRAY.each do |ticker|
            
    #         Ticker.create!(last_price: ticker[:last_price], volume: ticker[:volume], name: ticker[:path])
                
    #         end
        
    #     izbrisi_sve_preko_48h
        
    #     ##########################
        
    #     respond_to do |format|
    #             format.html
    #             format.js {  }
    #         end
    # end
    
end

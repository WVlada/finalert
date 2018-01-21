class Ticker < ActiveRecord::Base
    def self.update
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
            
            @tickerARRAY.each_with_index do |ticker, index|
                
                if Ticker.where(name: ticker[:path]).last != nil
                    
                    last_price_percent = ((ticker[:last_price]/Ticker.where(name: ticker[:path]).last.last_price) - 1) * 100
                    volume_percent = ((ticker[:volume]/Ticker.where(name: ticker[:path]).last.volume) - 1) * 100
                    
                    
                    if last_price_percent > 5
                        posalji_alert(ticker, "cena plus")
                    
                    elsif last_price_percent < 5
                        posalji_alert(ticker, "cena minus")
                    
                    elsif volume_percent > 5
                        posalji_alert(ticker, "volume plus")
                    
                    elsif volume_percent < 5
                        posalji_alert(ticker, "volume minus")
                    
                    else
                        puts "Nema znacajnih promena"
                    end
                    
                    
                else
                    last_price_percent = 0
                
                end
                
                Ticker.create!(last_price: ticker[:last_price], last_price_percent: last_price_percent, volume: ticker[:volume], name: ticker[:path])
                
            end
        
        self.izbrisi_sve_preko_48h
        #########################
    end
    
    def self.izbrisi_sve_preko_48h
    
        Ticker.where("created_at < ?", 48.hours.ago).delete_all      
    
    end
    
    def self.posalji_alert(ticker, text)
        NotificationsMailer.new_message(ticker, text).deliver_now
    end
end

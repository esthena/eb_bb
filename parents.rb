require 'net/http'
require 'json'


zips = ['79745','98862','98841','98831','98822','98815','97739','97707','97702','97701','96818','95358','95351','95307','95129','94585','94534','94533','93036','92395','81147','79901','79855','79854','79852','79848','79845','79843','79842','79834','79830','79789','79782','79778','79772','79765','79764','79763','79762','79761','79756','79752','79749','79744','79743','79742','79739','79735','79734','79733','79731','79720','79718','79714','79707','79706','79705','79703','79701','79511','79410','79372','78593','77494','77493','77450','77449','77084','77079','76932','76844','76711','76710','76704','76693','76692','76689','76667','76649','76645','76637','76631','76627','76624','76569','76561','76554','76524','75862','75144','71858','71857','71854','71845','71837','71826','71825','71801','69142','69138','69130','69120','69101','68883','68882','68879','68878','68876','68875','68874','68873','68872','68869','68866','68863','68862','68859','68856','68853','68852','68850','68847','68845','68842','68840','68836','68835','68833','68827','68825','68824','68823','68822','68815','68814','68812','68803','68801','68760','68665','68071','68067','68047','68039','60651','60616','60614','58775','58581','58579','58577','58576','58575','58573','58572','58570','58568','58566','58561','58558','58554','58552','58545','58544','58540','58538','58535','58533','58530','58529','58528','58523','58504','58503','58501','58495','58494','58487','58482','58478','58463','58444','58413','55992','55990','55975','55965','55964','55956','55955','55947','55944','55943','55941','55939','55932','55923','55127','55110','55038','55009','52659','52656','52655','52654','52653','52649','52645','52641','52640','52637','52632','52627','52626','52625','52623','52621','52620','52601','52591','52590','52580','52577','52572','52571','52567','52565','52561','52556','52554','52553','52551','52544','52537','52536','52531','52501','52404','52248','51467','51466','51461','51458','51450','51449','51445','51443','51442','51439','51401','51360','51358','51357','51351','51347','51346','51342','51338','51334','51301','51248','51247','51246','51243','51239','51237','51234','51061','51060','51055','51053','51050','51034','51031','51030','51025','51020','51016','51012','51007','51006','51005','51004','51002','51001','50597','50595','50590','50588','50585','50583','50579','50575','50574','50568','50563','50562','50560','50554','50548','50541','50540','50539','50538','50536','50533','50530','50525','50523','50521','50519','50518','50514','50511','50510','50501','50480','50327','50325','50323','50322','50321','50320','50317','50316','50315','50314','50313','50312','50311','50310','50309','50278','50276','50273','50266','50265','50263','50261','50257','50255','50251','50250','50249','50248','50244','50237','50236','50235','50233','50228','50226','50225','50220','50219','50217','50216','50212','50211','50208','50207','50201','50170','50169','50168','50167','50166','50164','50163','50161','50160','50156','50139','50138','50131','50130','50129','50125','50124','50118','50115','50111','50109','50107','50105','50076','50072','50070','50069','50063','50062','50060','50058','50056','50055','50054','50050','50049','50047','50046','50044','50036','50035','50034','50028','50025','50023','50021','50014','50010','50009','50007','50003','50002','48363','48323','48317','48316','48315','48314','48313','48312','48310','48309','48307','48306','48304','48302','48044','48042','45251','45242','45236','45231','45223','45140','44811','44143','44131','44125','44089','44074','44011','44001','33408','23838','23836','23834','23832','23831','23803','23237','23236','23235','23234','23225','23120','23114','23113','23112','20817','20015','19530','19492','19475','19473','19468','19464','19456','19454','19446','19440','19438','19426','19422','19096','19095','19090','19072','19066','19046','19040','19038','19035','19027','19012','19010','19006','19004','19003','19002','18969','18964','18255','18240','18235','18232','18229','18210','18109','18106','18104','18103','18102','18101','18080','18078','18073','18071','18069','18067','18066','18062','18056','18054','18049','18041','18037','18036','18034','18032','18031','18015','18011','17365','17339','17319','17264','17257','17255','17249','17241','17113','17112','17111','17110','17109','17104','17103','17102','17101','17090','17074','17070','17068','17065','17062','17061','17057','17055','17050','17048','17043','17036','17033','17032','17028','17025','17024','17023','17022','17020','17019','17018','17013','17011','17007','17006','16868','16652','16623','16509','10591','10590','10562','10522','10510','10502','08822','08551','07826','04240']
for zip in zips
	genders = ['M', 'F']
	start = 4
	for g in genders
		print g + ", "
		tables = Array.new
		ages = ['18-24', '25-34', '35-44', '45-64', '65+']
		levels = ['<9th', 'Some HS', 'HS or GED', 'Some college', "Associate's", "Bachelor's", 'Graduate/Professional']
		table_base = 'B15001_0'
		for age in ages
			for lev in levels
				table = table_base + "%02d" % start + 'E'
				tables << table
				start +=1
			end
			start += 1
		end
		api_key = '0e909e40f2664f799a7f7865347804305a47b87c'
		base = 'http://api.census.gov/data/2011/acs5?'
		get = "="
		for table in tables
			get += table
			if !table.eql?(tables[-1])
				get += ","
			end	
		end
		geog = 'zip+code+tabulation+area:'+zip.to_s()
		url = base + "key=" + api_key + "&get" + get + "&for=" + geog
		resp = Net::HTTP.get_response(URI.parse(url))
		if resp.body!=nil
			res_array = JSON.parse(resp.body)[1]
				for r in res_array
					if r == nil
						print 'na'
					else
						print r
					end
					if r!=res_array[-1]
						print ", "
					else
						puts ""
					end
				end
		end	
		start += 1
	end
end
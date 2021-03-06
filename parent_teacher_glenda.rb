require 'pg'


db_connect = PG::Connection.open(:dbname =>'d558aauuf39s4q', :password =>'p7v0tj1517mpkg9ukoqufjdtrl9', :user =>'u6nk309ukhqv1g', :port =>5432, :host => 'ec2-54-235-208-253.compute-1.amazonaws.com')

print "School,ID,"

question_query = db_connect.exec("select sq.id as question
from survey_questions sq
where sq.survey_template_id = " + ARGV[0] + "
and sq.question_type like 'radio'
order by sq.id;")

questions = Array.new
for q in question_query
	questions << q['question']
	print q['question']
	print ","
end
puts ""

response =  db_connect.exec("select o.name as school, sr.id as user, sq.id as question, so.id as option
from organizations o
join schools s on s.id = o.entity_id
join survey_responses sr on sr.organization_id = o.id
join survey_data sd on sd.survey_response_id = sr.id
join survey_options so on so.id = sd.survey_option_id
join survey_questions sq on sq.id = sd.survey_question_id
join surveys sur on sur.id = sr.survey_id
where sq.survey_template_id = " + ARGV[0] + "
and sq.question_type like 'radio'
and s."+ ARGV[1] + "_school = 't'
and sur.name not like 'FAKE%'
and s.id!=1625
and s.id!=1958
and s.id!=2131
and s.id!=1694
and s.id!=1929
and s.id!=2013
and not (s.id<101433 and s.id>101400)
order by user, question;")
user_group = response.group_by{|key| key['user']}
user_group.each_key {|key| 
	print user_group[key][0]['school'] + ","
	print user_group[key][0]['user'] + ","
	answer_set = Hash.new
	for a in user_group[key]
		#puts answer_set
		answer_set[a['question']] = a['option']
	end
	for qu in questions
		print answer_set[qu]
		print ","
	end
	puts ""
	
	}

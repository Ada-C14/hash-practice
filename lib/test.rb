# def find_judge(n, trust)
#     relations = Hash.new {|h,k| h[k] = {outdegree: 0 , indegree: 0}}
    
#     trust.each do |a,b|
#         relations[a] = {
#             outdegree: + 1
#         }
#         relations[b] = {
#             indegree: + 1
#         }
#     end
    
#     judge = relations.select{|relation, hash| hash[indegree] == n - 1 && hash[outdegree] == 0}
    
#     # print relations
#     return judge
    
# end

# puts find_judge(2, [1,2])

# test = {indegree: 0,
# outdegree: 0}

# print test

h = Hash.new { |h,k| h[k] = { count: 0, rating: 0 } }
puts h
h
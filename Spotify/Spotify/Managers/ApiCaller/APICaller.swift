//
//  APICaller.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    private init(){}
    
    
    enum APIError:Error{
        case failToGetData
        
    }
    
    enum HttpMethod:String{
        case GET
        case POST
    }
    
    //MARK: - UserProfile Data
    public func getCurrentUserProfile(completion:@escaping(Result<UserProfile,Error>) -> Void){
        createReuest(with: URL(string:Constants.baseAPIURL+"/me"), type: .GET) { request in
        
            let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failToGetData))
                    return
                }
                
                do{
                    let result =  try JSONDecoder().decode(UserProfile.self, from: data)
                    print(result)
                    completion(.success(result) )
                    
                }
                catch{
                    completion(.failure(error))
                    
                }

            }
            task.resume()
        }
    }
    
    //MARK:- Get RecommendationList
    
    public func getRecommendationList(genre:Set<String>,completion:@escaping(Result<String,Error>) -> Void){
        let seeds = genre.joined(separator:",")
        createReuest(with: URL(string:Constants.baseAPIURL+"/recommendations?seed_genres=\(seeds)"), type: .GET) { request in
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                do{
                    let result =   try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    print("RecommendedList ===\(result)")
                }
                
                catch let error{
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
    }
    
    
    //MARK:- Get New Releases
    public func getNewReleases(completion:@escaping (Result<NewReleasesModel,Error>)-> Void){
        createReuest(with: URL(string: Constants.baseAPIURL+"/browse/new-releases?limits=50"), type: .GET) {
            request in
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do
                {
                    let result = try JSONDecoder().decode(NewReleasesModel.self, from: data)
                    print("NewReleasesData===\(result)")
                    completion(.success(result))
                   
                }
                catch let error{
                    //print(error.localizedDescription)
                    completion(.failure(error))
                }
                
            }
            task.resume()
        }
    }
    
    
    //MARK:- Get Featured Playlists
    
    public func getFeaturedPlayLists(completion:@escaping(Result<FeaturePlayListModel,Error>)->Void){
        createReuest(with: URL(string: Constants.baseAPIURL+"/browse/featured-playlists?limit=20"), type: .GET) { reqest in
        
            let task = URLSession.shared.dataTask(with: reqest) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let result = try JSONDecoder().decode(FeaturePlayListModel.self, from: data)
                    print("FeaturedPlayList===\(result)")
                    completion(.success(result))
                }
                catch let error
                {
                    completion(.failure(error))
                }

            }
            task.resume()
            
        }
    }
    
    
    //MARK:- Get Recommended Genres
    
    public func getRecommendedGenres(completion:@escaping(Result<RecommnededGenreModel,Error>)-> Void){
        createReuest(with: URL(string:Constants.baseAPIURL+"/recommendation/avaible-genre-seeds"), type: .GET) { request in
            
            let task = URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let result =  try JSONDecoder().decode(RecommnededGenreModel.self, from: data)
                    print("GnereList===\(result)")
                    completion(.success(result))
                }
                catch let error
                {
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
    }
   
    
    //MARK:- Private Request Method with HTTPMethod type
    private func createReuest(with url:URL?,type:HttpMethod, completion:@escaping(URLRequest) -> Void) {
        AuthManager.shared.withValidToken { token in
            guard let url = url else {
                    return
            }
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
        
    }
    
}






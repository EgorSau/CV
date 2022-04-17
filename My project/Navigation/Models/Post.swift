//
//  Post.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 09.03.2022.
//

import UIKit

class Post {
    
    struct PostModel {
        let author: String
        let description: String
        let image: String
        var likes: Int
        var views: Int
    }
    
    var postArray = [PostModel]()
    
    enum imagesNames: String {
        case matrix = "matrix"
        case terminator = "terminator"
        case manInBlack = "manInBlack"
        case babyDriver = "babyDriver"
    }
    
    func addPostsIntoArray(){
        let post1 = PostModel(author: "The Matrix",
                         description: "Хакер Нео узнает, что его мир — виртуальный. Выдающийся экшен, доказавший, что зрелищное кино может быть умным",
                         image: Post.imagesNames.matrix.rawValue,
                         likes: 313,
                         views: 624356)

        let post2 = PostModel(author: "Baby Driver",
                         description: "Гонщик-виртуоз помогает грабителям и влюбляется в официантку. Музыкальный экшен Эдгара Райта",
                         image: Post.imagesNames.babyDriver.rawValue,
                         likes: 205,
                         views: 213670)

        let post3 = PostModel(author: "Terminator 2: Judgment Day",
                         description: "Теперь у Сары родился сын Джон и время, когда он поведёт за собой выживших людей на борьбу с машинами, неумолимо приближается. Именно в этот момент из постапокалиптического будущего прибывает новый терминатор — практически неуязвимая модель T-1000, способная принимать любое обличье. Цель нового терминатора уже не Сара, а уничтожение молодого Джона Коннора.",
                         image: Post.imagesNames.terminator.rawValue,
                         likes: 240,
                         views: 382936)

        let post4 = PostModel(author: "Men in Black International",
                         description: "Агенты Эйч и Эм сдерживают вторжение паразитов. Спин-офф франшизы, снятый с искренней верой в инопланетян",
                         image: Post.imagesNames.manInBlack.rawValue,
                         likes: 73,
                         views: 145463)

        self.postArray.append(contentsOf: [post1, post2, post3, post4])
    }
}

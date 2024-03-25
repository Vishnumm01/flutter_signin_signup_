import 'package:flutter/material.dart';

class Canteen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentDay = now.weekday;

    Map<int, List<Dish>> dailyDishes = {
      DateTime.monday: [
        Dish(name: 'Idli', price: 10, available: true, imageUrl: 'https://c.ndtvimg.com/2023-03/95a2q19_idli_625x300_30_March_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886'),
        Dish(name: 'Dosa', price: 10, available: true, imageUrl: 'https://www.bing.com/images/search?view=detailV2&ccid=AAeMOleC&id=9D808DF4F72C3B8E57826910516228A1A280FB4C&thid=OIP.AAeMOleCsTZ6bN_MA_cQqQHaEK&mediaurl=https%3a%2f%2ffoodiewish.com%2fwp-content%2fuploads%2f2020%2f05%2fMasala-Dosa-Recipe.jpg&exph=720&expw=1280&q=dosa+image&simid=608037120626875032&FORM=IRPRST&ck=ADE8EA26427D2B39A24D387218A01256&selectedIndex=1&itb=0'),
        Dish(name: 'Egg curry', price: 20, available: true, imageUrl: 'https://www.archanaskitchen.com/images/archanaskitchen/0-Archanas-Kitchen-Recipes/2018/Dhaba_Style_Egg_Curry_Recipe-3.jpg'),
        Dish(name: 'Pazham Pori', price: 10, available: true, imageUrl: 'https://th.bing.com/th/id/OIP.CxNKEf30b9Gw3F0CJP62qQHaFj?rs=1&pid=ImgDetMain'),
        Dish(name: 'Bhaji', price: 10, available: true, imageUrl: 'https://th.bing.com/th/id/OIP.nVCQ6EvPBTCcIo7uIynzcwHaEo?rs=1&pid=ImgDetMain'),
        Dish(name: 'Tea', price: 10, available: true, imageUrl: 'https://th.bing.com/th/id/OIP.-V-H75zGUx6oDMhlb_hJZgHaE8?rs=1&pid=ImgDetMain'),
        Dish(name: 'Oonu', price: 30, available: true, imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/9/95/Sadhya_DSW.jpg'),
        Dish(name: 'Lime juice', price: 10, available: true, imageUrl: 'https://www.unileverfoodsolutions.lk/dam/global-ufs/mcos/meps/sri-lanka/calcmenu/recipes/LK-recipes/general/lime-juice/main-header.jpg'),
      ],
      DateTime.tuesday: [
        Dish(name: 'ucha Oonu', price: 30, available: true, imageUrl: 'https://b.zmtcdn.com/data/pictures/chains/5/18892545/6c58607e99f11e40968a90883ff70f1d.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A'),
        Dish(name: 'Dosa', price: 10, available: true, imageUrl: 'https://www.kannammacooks.com/wp-content/uploads/tomato-dosai-1-4.jpg'),
        Dish(name: 'Puttu', price: 10, available: true, imageUrl: 'https://1.bp.blogspot.com/-cfCwpaOtz-8/WTdgV_28j3I/AAAAAAAAIDQ/wLWUaaAIlRYDm4aAptgSJFPcaM9o6mjGgCLcB/s1600/DSC_0027.JPG'),
        Dish(name: 'Kadala curry', price: 20, available: true, imageUrl: 'https://th.bing.com/th/id/R.7ff843e0b9e35e8339e546a6cd3f4c8d?rik=5%2f%2bn4TB0pMSBoQ&riu=http%3a%2f%2f2.bp.blogspot.com%2f-mbhqXhGLOhk%2fU6pI75sT0HI%2fAAAAAAAAH7Y%2fRalASIWZx0U%2fs1600%2fDSC_0810-001.JPG&ehk=lcluaY7rYz2z2qVanU9yDG3%2fDpZz4VBWwHyhqAHyjtQ%3d&risl=&pid=ImgRaw&r=0'),
        Dish(name: 'Fish fry', price: 20, available: true, imageUrl: 'https://1.bp.blogspot.com/-dmr7TvaMJ7c/WRyLh1RZjlI/AAAAAAAAIF4/uPHo3WFtctE8ZS34-s0mkRyNRkU-2-SzgCLcB/s1600/0000000000000000000000A%2B%25281%2529.jpg'),
        Dish(name: 'Pazham Pori', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Bhaji', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Tea', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Lime juice', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
      ],
      DateTime.wednesday: [
        Dish(name: 'ucha Oonu', price: 30, available: true, imageUrl: 'https://b.zmtcdn.com/data/pictures/chains/5/18892545/6c58607e99f11e40968a90883ff70f1d.jpg?fit=around%7C200%3A200&crop=200%3A200%3B%2A%2C%2A'),
        Dish(name: 'Chikken Biryani', price: 60, available: true, imageUrl: 'https://th.bing.com/th/id/OIP.uoj6gmgX6NGVyvD4GHKx3gAAAA?rs=1&pid=ImgDetMain'),
        Dish(name: 'Idli', price: 10, available: true, imageUrl: 'https://c.ndtvimg.com/2023-03/95a2q19_idli_625x300_30_March_23.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886'),
        Dish(name: 'Pazham Pori', price: 10, available: true, imageUrl: 'https://pbs.twimg.com/media/FYxFAQJaIAEUULW.png'),
        Dish(name: 'parippu vada', price: 10, available: true, imageUrl: 'https://www.tastycircle.com/wp-content/uploads/2012/09/parippu-vada.jpg'),
        Dish(name: 'Tea', price: 10, available: true, imageUrl: 'https://whittockconsulting.co.uk/wp-content/uploads/2019/10/dreamstime_xs_123605413.jpg'),
        Dish(name: 'Lime juice', price: 10, available: true, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSLUl12NsPUmOi96eUmy2_lI7mNqTJzfie-A&usqp=CAU'),
      ],
      DateTime.thursday: [
        Dish(name: 'ucha Oonu', price: 30, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2016/03/05/19/37/appetite-1238459_960_720.jpg'),
        Dish(name: 'Dosa', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Puttu', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Kadala curry', price: 20, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Vegetable Kuruma', price: 4.99, available: true, imageUrl: 'https://th.bing.com/th/id/OIP.uC11Gi60zkILCM-poKfsjQHaE7?rs=1&pid=ImgDetMain'),
        Dish(name: 'Pazham Pori', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Bhaji', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Tea', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Lime juice', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
      ],
      DateTime.friday: [
        Dish(name: 'ucha Oonu', price: 30, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2016/03/05/19/37/appetite-1238459_960_720.jpg'),
        Dish(name: 'Dosa', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Idli', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Kadala curry', price: 20, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Fish fry', price: 20, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/05/14/16/46/fruit-2319871_960_720.jpg'),
        Dish(name: 'Bhaji', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Tea', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
        Dish(name: 'Lime juice', price: 10, available: true, imageUrl: 'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
      ],
    };

    List<Dish>? dishesForToday = dailyDishes[currentDay];

    if (dishesForToday != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Canteen'),
          backgroundColor: Colors.lightBlue,
        ),
        body: CanteenMenu(dishes: dishesForToday),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Canteen Closed'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Text(
            'Canteen is closed today',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}

class CanteenMenu extends StatelessWidget {
  final List<Dish> dishes;

  CanteenMenu({required this.dishes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dishes.length,
      itemBuilder: (BuildContext context, int index) {
        Dish dish = dishes[index];
        return ListTile(
          title: Text(
            dish.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text('\$${dish.price.toStringAsFixed(0)}', style: TextStyle(fontWeight: FontWeight.bold)),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(dish.imageUrl),
          ),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: dish.available ? Colors.green : Colors.grey,
            ),
            child: Text(
              dish.available ? 'Add to Cart' : 'Not Available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (dish.available) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added ${dish.name} to cart'),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${dish.name} is not available'),
                ));
                
              }
            },
          ),
        );
      },
    );
  }
}

class Dish {
  final String name;
  final double price;
  final bool available;
  final String imageUrl;

  Dish({
    required this.name,
    required this.price,
    required this.available,
    required this.imageUrl,
  });
}
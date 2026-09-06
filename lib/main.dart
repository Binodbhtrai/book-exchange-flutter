import 'package:flutter/material.dart';

void main() {
  runApp(const BookExchangeApp());
}

// =====================================================
// APP
// =====================================================

class BookExchangeApp extends StatelessWidget {
  const BookExchangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Exchange',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

// =====================================================
// BOOK MODEL
// =====================================================

class Book {
  final String title;
  final String author;
  final String category;
  final String condition;
  final double price;
  final String description;
  final String imageUrl;
  final String sellerName;
  final String sellerImageUrl;
  final bool available;

  const Book({
    required this.title,
    required this.author,
    required this.category,
    required this.condition,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.sellerName,
    required this.sellerImageUrl,
    this.available = true,
  });
}

// =====================================================
// SAMPLE BOOK DATA
// =====================================================

const List<Book> sampleBooks = [
  Book(
    title: 'Python Crash Course',
    author: 'Eric Matthes',
    category: 'Information Technology',
    condition: 'Good',
    price: 25,
    description: 'A beginner-friendly Python programming book. Used for one semester with minor highlighting.',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9781718502703-L.jpg',
    sellerName: 'Alex Student',
    sellerImageUrl: 'https://i.pravatar.cc/150?img=12',
  ),
  Book(
    title: 'Designing Data-Intensive Applications',
    author: 'Martin Kleppmann',
    category: 'Information Technology',
    condition: 'Like New',
    price: 35,
    description: 'A useful book for students learning about modern data systems, databases and distributed applications.',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9781449373320-L.jpg',
    sellerName: 'Sarah Lee',
    sellerImageUrl: 'https://i.pravatar.cc/150?img=47',
  ),
  Book(
    title: 'Clean Code',
    author: 'Robert C. Martin',
    category: 'Software Development',
    condition: 'Very Good',
    price: 30,
    description: 'A popular software development book covering clean coding principles and professional programming practices.',
    imageUrl: 'https://covers.openlibrary.org/b/isbn/9780132350884-L.jpg',
    sellerName: 'Daniel Wong',
    sellerImageUrl: 'https://i.pravatar.cc/150?img=33',
  ),
];

// =====================================================
// LOGIN SCREEN
// =====================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          size: 52,
                          color: Color(0xFF2563EB),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Book Exchange',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Student Book Sharing Platform',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF64748B),
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Student Email',
                          hintText: 'e.g. student@koi.edu.au',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: FilledButton(
                          onPressed: login,
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('New student?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text('Create Account'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SIGN UP SCREEN
// =====================================================

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 70,
                    color: Color(0xFF2563EB),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Join Book Exchange',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 25),

                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'e.g. Alex Student',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Student Email',
                      hintText: 'e.g. student@koi.edu.au',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Create a password',
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account created successfully.'),
                          ),
                        );

                        Navigator.pop(context);
                      },
                      child: const Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// MAIN NAVIGATION SHELL
// =====================================================

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  final List<Book> books = List<Book>.from(sampleBooks);

  void openBook(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book)),
    );
  }

  void addBook(Book book) {
    setState(() {
      books.insert(0, book);
      selectedIndex = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${book.title} added successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        books: books,
        onOpenBook: openBook,
        onNavigate: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      SearchScreen(books: books, onOpenBook: openBook),
      AddBookScreen(onAddBook: addBook),
      ProfileScreen(books: books),
    ];

    const titles = ['Book Exchange', 'Search Books', 'Add Book', 'My Profile'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline),
            selectedIcon: Icon(Icons.add_circle),
            label: 'Add Book',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME SCREEN
// =====================================================

class HomeScreen extends StatelessWidget {
  final List<Book> books;
  final Function(Book) onOpenBook;
  final Function(int) onNavigate;

  const HomeScreen({
    super.key,
    required this.books,
    required this.onOpenBook,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF2563EB), Color(0xFF60A5FA)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/150?img=11',
                            ),
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back!',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Find your next textbook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () => onNavigate(1),
                      child: AbsorbPointer(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search title, author or category...',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.tune),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Browse Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        CategoryChip(label: 'IT', icon: Icons.computer),
                        CategoryChip(
                          label: 'Business',
                          icon: Icons.business_center,
                        ),
                        CategoryChip(label: 'Science', icon: Icons.science),
                        CategoryChip(
                          label: 'Mathematics',
                          icon: Icons.calculate,
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Available Books',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        TextButton(
                          onPressed: () => onNavigate(1),
                          child: const Text('View All'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    ...books.map(
                      (book) => BookListCard(
                        book: book,
                        onTap: () => onOpenBook(book),
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton.icon(
                        onPressed: () => onNavigate(2),
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text(
                          'List a Book',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// =====================================================
// CATEGORY CHIP
// =====================================================

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: const Color(0xFF2563EB)),
      label: Text(label),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFFDBEAFE)),
    );
  }
}

// =====================================================
// BOOK CARD
// =====================================================

class BookListCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const BookListCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  book.imageUrl,
                  width: 92,
                  height: 125,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 92,
                      height: 125,
                      color: const Color(0xFFDBEAFE),
                      child: const Icon(
                        Icons.menu_book,
                        size: 50,
                        color: Color(0xFF2563EB),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      book.author,
                      style: const TextStyle(color: Color(0xFF64748B)),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        SmallBadge(label: book.condition),
                        const SmallBadge(label: 'Available'),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${book.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Color(0xFF2563EB),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Color(0xFF64748B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SMALL BADGE
// =====================================================

class SmallBadge extends StatelessWidget {
  final String label;

  const SmallBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF2563EB),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// =====================================================
// SEARCH SCREEN
// =====================================================

class SearchScreen extends StatefulWidget {
  final List<Book> books;
  final Function(Book) onOpenBook;

  const SearchScreen({
    super.key,
    required this.books,
    required this.onOpenBook,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredBooks = widget.books.where((book) {
      final searchText = query.toLowerCase();

      return book.title.toLowerCase().contains(searchText) ||
          book.author.toLowerCase().contains(searchText) ||
          book.category.toLowerCase().contains(searchText);
    }).toList();

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                TextField(
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      query = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search by title, author or category',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: filteredBooks.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 60,
                                color: Color(0xFF94A3B8),
                              ),
                              SizedBox(height: 12),
                              Text(
                                'No books found',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredBooks.length,
                          itemBuilder: (context, index) {
                            final book = filteredBooks[index];

                            return BookListCard(
                              book: book,
                              onTap: () => widget.onOpenBook(book),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// BOOK DETAILS SCREEN
// =====================================================

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        book.imageUrl,
                        width: 190,
                        height: 270,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 190,
                            height: 270,
                            color: const Color(0xFFDBEAFE),
                            child: const Icon(
                              Icons.menu_book,
                              size: 80,
                              color: Color(0xFF2563EB),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    book.title,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'by ${book.author}',
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      SmallBadge(label: book.category),
                      SmallBadge(label: book.condition),
                      const SmallBadge(label: 'Available'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text(
                    '\$${book.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2563EB),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    book.description,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Seller',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundImage: NetworkImage(book.sellerImageUrl),
                      ),
                      title: Text(
                        book.sellerName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Verified student seller'),
                      trailing: const Icon(
                        Icons.verified,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                RequestConfirmationScreen(book: book),
                          ),
                        );
                      },
                      icon: const Icon(Icons.send_outlined),
                      label: const Text(
                        'Request Book',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Books'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// REQUEST CONFIRMATION
// =====================================================

class RequestConfirmationScreen extends StatelessWidget {
  final Book book;

  const RequestConfirmationScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Confirmation'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDCFCE7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        size: 65,
                        color: Color(0xFF16A34A),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Request Sent!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Your request for "${book.title}" has been sent to ${book.sellerName}.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text('Back to Home'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// ADD BOOK SCREEN
// =====================================================

class AddBookScreen extends StatefulWidget {
  final Function(Book) onAddBook;

  const AddBookScreen({super.key, required this.onAddBook});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  String selectedCondition = 'Good';

  void submitBook() {
    if (titleController.text.trim().isEmpty ||
        authorController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter title, author and price.')),
      );
      return;
    }

    final price = double.tryParse(priceController.text.trim());

    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid price.')),
      );
      return;
    }

    final newBook = Book(
      title: titleController.text.trim(),
      author: authorController.text.trim(),
      category: categoryController.text.trim().isEmpty
          ? 'General'
          : categoryController.text.trim(),
      condition: selectedCondition,
      price: price,
      description: descriptionController.text.trim().isEmpty
          ? 'Student book listing.'
          : descriptionController.text.trim(),
      imageUrl: imageController.text.trim().isEmpty
          ? 'https://covers.openlibrary.org/b/isbn/9780132350884-L.jpg'
          : imageController.text.trim(),
      sellerName: 'You',
      sellerImageUrl: 'https://i.pravatar.cc/150?img=11',
    );

    widget.onAddBook(newBook);

    titleController.clear();
    authorController.clear();
    categoryController.clear();
    priceController.clear();
    descriptionController.clear();
    imageController.clear();

    setState(() {
      selectedCondition = 'Good';
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    categoryController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: Color(0xFF2563EB),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'List a textbook so another student can find and request it.',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Book Title *',
                    hintText: 'e.g. Database Systems',
                    prefixIcon: Icon(Icons.menu_book),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: authorController,
                  decoration: const InputDecoration(
                    labelText: 'Author *',
                    hintText: 'e.g. Jane Smith',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    hintText: 'e.g. Information Technology',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                ),

                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  initialValue: selectedCondition,
                  decoration: const InputDecoration(
                    labelText: 'Condition',
                    prefixIcon: Icon(Icons.auto_awesome),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Like New',
                      child: Text('Like New'),
                    ),
                    DropdownMenuItem(
                      value: 'Very Good',
                      child: Text('Very Good'),
                    ),
                    DropdownMenuItem(value: 'Good', child: Text('Good')),
                    DropdownMenuItem(
                      value: 'Acceptable',
                      child: Text('Acceptable'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCondition = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price *',
                    hintText: 'e.g. 25',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'e.g. Used for one semester, minor highlighting',
                    prefixIcon: Icon(Icons.description_outlined),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    labelText: 'Book Cover Image URL (optional)',
                    hintText: 'Paste an image URL or leave blank',
                    prefixIcon: Icon(Icons.image_outlined),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: submitBook,
                    icon: const Icon(Icons.add_circle),
                    label: const Text(
                      'Add Book',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// PROFILE SCREEN
// =====================================================

class ProfileScreen extends StatelessWidget {
  final List<Book> books;

  const ProfileScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 58,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=11',
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Student Profile',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                const Text(
                  'KOI Student',
                  style: TextStyle(color: Color(0xFF64748B)),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    Expanded(
                      child: ProfileStatCard(
                        number: books.length.toString(),
                        label: 'Books',
                        icon: Icons.menu_book,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: ProfileStatCard(
                        number: '2',
                        label: 'Requests',
                        icon: Icons.swap_horiz_rounded,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Card(
                  color: Colors.white,
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text('Student Email'),
                        subtitle: Text('student@koi.edu.au'),
                      ),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.school_outlined),
                        title: Text('Institution'),
                        subtitle: Text("King's Own Institute"),
                      ),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text('Location'),
                        subtitle: Text('Sydney, Australia'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// PROFILE STAT
// =====================================================

class ProfileStatCard extends StatelessWidget {
  final String number;
  final String label;
  final IconData icon;

  const ProfileStatCard({
    super.key,
    required this.number,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF2563EB), size: 30),
            const SizedBox(height: 8),
            Text(
              number,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(label, style: const TextStyle(color: Color(0xFF64748B))),
          ],
        ),
      ),
    );
  }
}

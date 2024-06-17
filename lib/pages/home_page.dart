import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/componentes/catalogo_view.dart';
import 'package:quitanda/componentes/produto_item_list.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _numeroAbaSelecionada;
  late Future<List<String>> _categoriasFuture;
  late List<String> _categorias;
  late List<Widget> _abas;

  @override
  void initState() {
    super.initState();

    final catalogo = Provider.of<Catalogo>(
      context,
      listen: false,
    );

    _numeroAbaSelecionada = 0;
    _categoriasFuture = catalogo.findCategorias();
    _abas = [];
    _categorias = [];
  }

  @override
  Widget build(BuildContext context) {
    //na linha abaixo a gente esta pedindo um catalogo gerenciado
    //para o provider. A partir de agora, toda mudança no Catalogo
    //vai causar uma atualização aqui
    final catalogo = Provider.of<Catalogo>(context);
    final carrinho = Provider.of<Carrinho>(context);

    int quantidade = carrinho.pedido.quantidade;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Badge(
            label: Text("$quantidade"),
            isLabelVisible: quantidade > 0,
            alignment: Alignment.bottomLeft,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(
                context,
                "/carrinho",
              ),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/perfil",
            ),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _categoriasFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return error(snapshot.error?.toString() ?? "");
          }

          if (snapshot.hasData) {
            return body(snapshot.data!);
          }

          return loading();
        },
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget loading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: const CircularProgressIndicator(),
          ),
          const Text("Carregando"),
        ],
      ),
    );
  }

  Widget error(String erro) {
    final tema = Theme.of(context);

    return Center(
      child: Container(
        color: tema.colorScheme.error,
        padding: const EdgeInsets.all(12),
        child: Text(
          "Ocorreu um erro $erro",
          style: tema.textTheme.titleLarge?.copyWith(
            color: tema.colorScheme.onError,
          ),
        ),
      ),
    );
  }

  Widget body(List<String> categorias) {
    if (_abas.isEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _categorias = categorias;
          _abas = categorias
              .map(
                (c) => CatalagoView(categoria: c),
              )
              .toList();
        });
      });

      return loading();
    }

    return Center(
      child: _abas.elementAt(_numeroAbaSelecionada),
    );
  }

  Widget? bottomNavigationBar() {
    if (_categorias.isEmpty) {
      return null;
    }

    final itens = _categorias
        .map(
          (c) => BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: c,
          ),
        )
        .toList();

    return BottomNavigationBar(
      items: itens,
      currentIndex: _numeroAbaSelecionada,
      onTap: (value) => setState(() {
        _numeroAbaSelecionada = value;
      }),
    );
  }
}

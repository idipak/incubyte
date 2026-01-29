import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/article_bloc.dart';
import '../bloc/article_event.dart';
import '../bloc/article_state.dart';
import '../widgets/article_card.dart';
import '../../../../injection_container.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101922), // background-dark
      body: SafeArea(
        child: BlocProvider(
          create: (_) => sl<ArticleBloc>()..add(FetchArticles()),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    if (state is ArticleLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ArticleLoaded) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(20),
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return ArticleCard(article: state.articles[index]);
                        },
                      );
                    } else if (state is ArticleError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF101922).withValues(alpha: 0.9),
        border: const Border(
          bottom: BorderSide(
            color: Color(0xFF1e293b), // border-slate-800
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Discover',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: const Icon(
              Icons.bookmark,
              color: Color(0xFFcbd5e1), // slate-300
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

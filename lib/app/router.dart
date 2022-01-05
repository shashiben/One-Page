import 'package:bootstrap/home.dart';
import 'package:bootstrap/views/portfolio_detail_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey, child: const Home()),
    ),
    GoRoute(
      path: '/portfolio-details',
      pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey, child: const PortfolioDetailSection()),
    )
  ],
  initialLocation: '/',
  urlPathStrategy: UrlPathStrategy.path,
);

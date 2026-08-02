import adapter from '@sveltejs/adapter-static';
import { mdsvex } from 'mdsvex';

const basePath = process.env.BASE_PATH || '';

function prefixBasePath() {
	return (tree) => {
		function visit(node) {
			if (!node || typeof node !== 'object') return;

			if (
				basePath &&
				(node.type === 'link' || node.type === 'image') &&
				typeof node.url === 'string' &&
				node.url.startsWith('/') &&
				!node.url.startsWith('//') &&
				!node.url.startsWith(`${basePath}/`)
			) {
				node.url = `${basePath}${node.url}`;
			}

			if (basePath && node.type === 'html' && typeof node.value === 'string') {
				node.value = node.value
					.replace(/(href|src)="\/(?!\/)/g, `$1="${basePath}/`)
					.replace(/(href|src)='\/(?!\/)/g, `$1='${basePath}/`);
			}

			if (Array.isArray(node.children)) {
				node.children.forEach(visit);
			}
		}

		visit(tree);
	};
}

/** @type {import('@sveltejs/kit').Config} */
const config = {
	extensions: ['.svelte', '.md'],
	preprocess: [
		mdsvex({
			extensions: ['.md'],
			remarkPlugins: [prefixBasePath]
		})
	],
	kit: {
		adapter: adapter({
			fallback: '404.html'
		}),
		paths: {
			base: basePath
		},
		prerender: {
			handleHttpError: 'warn'
		}
	}
};

export default config;

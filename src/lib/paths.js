import { base } from '$app/paths';

export function withBase(path = '') {
	if (!path || !path.startsWith('/') || path.startsWith('//')) {
		return path;
	}

	if (base && path.startsWith(`${base}/`)) {
		return path;
	}

	return `${base}${path}`;
}
